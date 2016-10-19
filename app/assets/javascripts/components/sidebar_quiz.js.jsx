var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

let SidebarQuiz = React.createClass({
  getInitialState() {
    return{
      errorMessages: [],
      stats: [],
      disabled: false,
      showStats: false
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

  optionStyles(option){
    if (this.props.showAnswers) {
      if (option.correct && this.refs["option_" + option.id] !== undefined && this.refs["option_" + option.id].checked) {
        return { boxShadow: "inset 0 0 0 3px #5cb85c", }
      } else {
        return { boxShadow: "inset 0 0 0 3px #ec6952", }
      }
    } 
  },

  highlightSyntax(){
    $(".sidebar-form").find("pre code").each(function(_, block) {
      hljs.highlightBlock(block);
    });
  },

  handleNextQuestion(e){
    e.preventDefault();
    this.setState({disabled: false});
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
        <div>
          <ReactCSSTransitionGroup transitionName='score' 
                                   transitionAppear={true} 
                                   transitionAppearTimeout={500}
                                   transitionEnterTimeout={500} 
                                   transitionLeaveTimeout={500}>
            <h3 key={"average_score_" + this.props.averageScore}>
              Score
            </h3>
          
            <h2 key={"score_" + this.props.averageScore}>
              You scored {Math.round(this.props.averageScore)}%!
            </h2>

            <hr />

            <p key={"message_" + this.props.averageScore}>
              {this.props.averageScore >= this.passingGrade ? "Congratulations! You've passed the quizzes." : `You must score at least ${this.passingGrade} to pass. Take the quiz again to mark this lesson as completed!`}
            </p>

            <br />

            <button onClick={this.props.handleRetakeQuiz} className="btn btn-cta-primary pull-right">
              <i className="fa fa-repeat" aria-hidden="true"></i> Retake Quiz
            </button>

          </ReactCSSTransitionGroup>
        </div>
      )
    }
    else {
      let options = this.props.quizProblems[this.props.currentPosition].quiz_options.map((option) => {
        return (
          <div key={option.id} className="checkbox quiz-options" style={this.optionStyles(option)}>
            <label>
                  <input type="checkbox" 
                         name={this.props.quizProblems[this.props.currentPosition].id} 
                         value={option.id} 
                         ref={"option_" + option.id}
                         onChange={this.handleChange}                         
                         />
                  {option.content}
            </label>
          </div>
        )
      });

      let actionButton;
      if (this.props.showAnswers) {
        actionButton = <button className="btn btn-cta-primary pull-right" onClick={this.handleNextQuestion}>Next</button>
      }
      else {
        actionButton = <button className="btn btn-cta-primary submit-btn pull-right" onClick={this.handleSubmit} disabled={(this.state.disabled)? "disabled" : ""}>Submit Answer</button>            
      }     

      let problemsLeft = this.props.quizProblems.length - this.props.currentPosition; 

      return (
          <div>
            <div className="row">
              <div className="col-xs-12">
                <div className="quiz-container">
                  <ReactCSSTransitionGroup transitionName='quiz' 
                           transitionAppear={true} 
                           transitionAppearTimeout={500}
                           transitionEnterTimeout={500} 
                           transitionLeaveTimeout={500}>
                    <div style={{position: "absolute", top: "10px", right: "20px", left: "20px"}} key={"container_" + this.props.currentPosition}>
                    
                      <div dangerouslySetInnerHTML={{__html: this.props.quizProblems[this.props.currentPosition].question}} key={this.props.currentPosition}/>

                      {options}
                    </div>
                  </ReactCSSTransitionGroup>
                </div>
              </div>
            </div>

            <div className="row">
              <div className="col-xs-12 col-md-8">

                <div className="progress">
                  <div className="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
                  aria-valuemin="0" aria-valuemax="100" style={{width: this.props.averageScore + "%"}}>
                    {Math.round(this.props.averageScore)}%
                  </div>
                </div>
                
                <small className="pull-right">
                  {problemsLeft + " " + (problemsLeft !== 1 ? "problems" : "problem")}  left!
                </small>
              </div>
              <div className="col-xs-12 col-md-4">
                {actionButton}
                <button onClick={this.handleToggleStats} className="btn btn-sm btn-cta-secondary pull-right">Stats</button>
              </div>
            </div>
          </div>        
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

  render(){    
    let stats = this.state.stats.map((stat) => {
      return <SidebarStat key={stat.id} stat={stat}/>
    });

    if (this.state.showStats){
      return (
        <form className="sidebar-form" style={this.sidebarFormStyles()}>
          <h3>Your Stats</h3>
          <div className="dropdown sort-menu pull-right">
            <button className="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
              <i className="fa fa-bars" style={{"color": "#333"}} aria-hidden="true"></i>
            </button>
            <ul className="dropdown-menu" aria-labelledby="dropdownMenu1">
              <li onClick={this.sortStatsByHighest}>
                Highest Scores                  
              </li>
              <li onClick={this.sortStatsByLowest}>
                Lowest Scores                
              </li>
            </ul>
          </div>
          
          {stats}
        </form> 
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