var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

let SidebarQuiz = React.createClass({
  getInitialState() {
    return{
      errorMessages: [],
      stats: [],
      disabled: false,
      showStats: false,
      submitted: false
    };
  },

  passingGrade: 85,

  handleChange(e){
    let id = e.target.value;
    this.props.handleCheckedOptionIdsChange(id);
  },

  handleSubmit(e){
    e.preventDefault();
    this.setState({disabled: true});

    $.ajax({
      dataType: 'JSON',
      type: 'POST',
      url: '/quiz_submissions',
      context: this,
      data: {
        quiz_submission: {
          quiz_problem_id: this.props.quizProblems[this.props.currentPosition].id,
          checked_option_ids: this.props.checkedOptionIds
        }
      },
      success(data){
        this.props.handleQuizSubmission(data); 
        this.setState({submitted: true});
        if (this.props.quizProblems.length == (this.props.currentPosition + 1)) {
          this.handleFinishQuiz();
        }        
      },
      error(xhr) {
        errorMessages = xhr.responseJSON.errors.map((error) => {
          return error
        });

        this.setState({errorMessages: errorMessages});
      }
    });
  },

  handleFinishQuiz(){
    if (this.props.averageScore >= this.passingGrade) {
      $.ajax({
        dataType: 'script',
        type: 'POST',
        url: '/quiz_completions',
        context: this,
        data: {
          quiz_completion: {
            lesson_id: this.props.lesson_id,
            course_name: this.props.course_name
          }
        },
        success(data){
          success_sound.play();
          this.props.handleFinishQuiz();
        }
      });
    }
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  highlightSyntax(){
    $(".sidebar-form").find("pre code").each(function(_, block) {
      hljs.highlightBlock(block);
    });
  },

  handleNextQuestion(e){
    e.preventDefault();
    this.setState({disabled: false, submitted: false});
    this.props.handleNextQuestion();
    this.highlightSyntax();
  },

  displayErrorMessages(){
    if (this.state.errorMessages.length >= 0) {
      let errorMessages = this.state.errorMessages.map((message) => {
        return <ErrorFlash key={message} errorMessage={message} />
      });

      return errorMessages;
    }
  },

  getStats(){
    $.ajax({
      dataType: 'JSON',
      url: '/quiz_category_ratings.json',
      context: this,
      success(data) {
        this.setState({stats: data})
      }
    });
  },

  handleToggleStats(e){
    e.preventDefault();
    this.setState({showStats: !this.state.showStats});
    this.getStats();
  },

  formContent(){
    if (this.props.quizProblems.length == 0) {
      return (
        <h3>There are no quizzes for this lesson!</h3>
      )
    } 
    else if (this.props.quizProblems.length == this.props.currentPosition) {
      return (
        <FinishQuiz averageScore={this.props.averageScore} 
                    handleToggleStats={this.handleToggleStats} 
                    handleRetakeQuiz={this.props.handleRetakeQuiz} />
      )
    }
    else {
      return (
        <QuizProblem quizProblems={this.props.quizProblems}
                     quizProblem={this.props.quizProblems[this.props.currentPosition]} 
                     submitted={this.state.submitted}
                     showAnswers={this.props.showAnswers}
                     handleChange={this.handleChange}
                     handleNextQuestion={this.handleNextQuestion}
                     handleSubmit={this.handleSubmit}
                     disabled={this.state.disabled}
                     currentPosition={this.props.currentPosition}
                     averageScore={this.props.averageScore}
                     handleToggleStats={this.handleToggleStats}/>
      )
    }
  },

  sortStatsByHighest(e){
    e.preventDefault;
    let stats = _.sortBy(this.state.stats, (stat) => { let scores = stat.score; return -scores; })
    this.setState({stats: stats});
  },

  sortStatsByLowest(e){
    e.preventDefault;
    let stats = _.sortBy(this.state.stats, (stat) => { return stat.score; });
    this.setState({stats: stats});
  },

  goBack(e){
    e.preventDefault();
    this.setState({showStats: false})
  },

  render(){
    if (this.state.showStats){
      return (
        <ReactCSSTransitionGroup transitionName='quiz' 
                                 transitionAppear={true} 
                                 transitionAppearTimeout={500}
                                 transitionEnterTimeout={500} 
                                 transitionLeaveTimeout={500}>
          <SidebarStats key={this.state.stats.length}
                        sidebarFormStyles={this.sidebarFormStyles()} 
                        sortStatsByLowest={this.sortStatsByLowest} 
                        sortStatsByHighest={this.sortStatsByHighest} 
                        stats={this.state.stats}
                        goBack={this.goBack}/>        
        </ReactCSSTransitionGroup>
      )
    } else {
      return (
        <form className="sidebar-form" style={this.sidebarFormStyles()}>
          {this.displayErrorMessages()}
          {this.formContent()}
        </form>
      )    
    }
  },

  componentDidMount(){
    this.highlightSyntax();
  }
});