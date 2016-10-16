var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

let SidebarQuiz = React.createClass({
  getInitialState() {
    return{
      errorMessages: [],
      disabled: false
    };
  },

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
    if (this.props.averageScore >= 90) {
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
      if (option.correct && this.refs["option_" + option.id].checked) {
        return { boxShadow: "inset 0 0 0 3px #5cb85c", }
      } else {
        return { boxShadow: "inset 0 0 0 3px #ec6952", }
      }
    } 
  },

  handleNextQuestion(e){
    e.preventDefault();
    this.setState({disabled: false});
    this.props.handleNextQuestion();
  },

  displayErrorMessages(){
    if (this.state.errorMessages.length >= 0) {
      let errorMessages = this.state.errorMessages.map((message) => {
        return <ErrorFlash key={message} errorMessage={message} />
      });

      return errorMessages;
    }
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
            <h3 key={"average_score_" + this.props.averageScore}>Score</h3>
          
            <h2 key={"score_" + this.props.averageScore}>You scored {Math.round(this.props.averageScore)}%!</h2>
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
                    <div style={{position: "absolute", top: "10px"}} key={"container_" + this.props.currentPosition}>
                    
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
              </div>
            </div>
          </div>        
      )
    }
  },

  render(){    
    return (
      <form className="sidebar-form" style={this.sidebarFormStyles()}>
        {this.displayErrorMessages()}
        {this.formContent()}
      </form>
    )    
  },

  componentDidMount(){
    $(".sidebar-form").find("pre code").each(function(_, block) {
      hljs.highlightBlock(block);
    });
  }
});