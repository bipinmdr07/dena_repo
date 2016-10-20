let QuizProblem = React.createClass({
  lessonLink(){
    let lesson_id = this.props.quizProblem.lesson_id;
    let course_name = this.props.quizProblem.course_name.replace(/([a-z])([A-Z])/g, '$1_$2').toLowerCase();

    if (this.props.showAnswers) {
      return (
        <a href={`/${course_name}s/${lesson_id}`} 
           target="_blank" 
           className="btn btn-sm btn-success"
           style={{"position": "absolute", "left": "20px", "bottom": "10px"}}>
          <i className="fa fa-graduation-cap" aria-hidden="true"></i> Review Lesson
        </a>
      )
    }    
  },

  render(){
    let options = this.props.quizProblem.quiz_options.map((option) => {
      return (
        <QuizOption key={option.id} 
                    option={option} 
                    submitted={this.props.submitted} 
                    showAnswers={this.props.showAnswers} 
                    handleChange={this.props.handleChange} 
                    quizProblem={this.props.quizProblem.id}/>          
      )
    });

    let actionButton;
    if (this.props.showAnswers) {
      actionButton = <button className="btn btn-cta-primary pull-right" onClick={this.props.handleNextQuestion}>Next</button>
    }
    else {
      actionButton = <button className="btn btn-cta-primary submit-btn pull-right" onClick={this.props.handleSubmit} disabled={(this.props.disabled)? "disabled" : ""}>Submit Answer</button>            
    }     

    let problemsLeft = this.props.quizProblems.length - this.props.currentPosition; 

    return (
      <div>
        <div className="row">
          <div className="col-xs-12">
            <ReactCSSTransitionGroup transitionName='quiz' 
                     transitionAppear={true} 
                     transitionAppearTimeout={500}
                     transitionEnterTimeout={500} 
                     transitionLeaveTimeout={500}>
              <div className="quiz-container" key={"container_" + this.props.currentPosition}>
                <div className="quiz-container-inner">
                  <div dangerouslySetInnerHTML={{__html: this.props.quizProblem.question}} key={this.props.currentPosition}/>

                  {options}
                </div>



                {this.lessonLink()}

                <p style={{"fontWeight": 600, "color": "white"}}>
                  Percentage Correct <small style={{"color": "#666"}}>{`Problem ${this.props.currentPosition + 1} out of ${this.props.quizProblems.length}`}</small>
                </p>

                <div className="progress">
                  <div className="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
                  aria-valuemin="0" aria-valuemax="100" style={{width: this.props.averageScore + "%"}}>
                    {Math.round(this.props.averageScore)}%
                  </div>
                </div>

                {actionButton}

                <button onClick={this.props.handleToggleStats} className="btn btn-sm btn-cta-secondary pull-left">
                  <i className="fa fa-bar-chart" aria-hidden="true"></i>
                </button>
              </div>

              
            </ReactCSSTransitionGroup>
          </div>
        </div>
      </div>        
    )
  }
})