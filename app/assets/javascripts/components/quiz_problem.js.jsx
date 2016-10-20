let QuizProblem = React.createClass({
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
            <div className="quiz-container">
              <ReactCSSTransitionGroup transitionName='quiz' 
                       transitionAppear={true} 
                       transitionAppearTimeout={500}
                       transitionEnterTimeout={500} 
                       transitionLeaveTimeout={500}>
                <div style={{position: "absolute", top: "10px", right: "20px", left: "20px"}} key={"container_" + this.props.currentPosition}>
                
                  <div dangerouslySetInnerHTML={{__html: this.props.quizProblem.question}} key={this.props.currentPosition}/>

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

        <div className="row">
          <div className="col-xs-12">
            <button onClick={this.props.handleToggleStats} className="btn btn-sm btn-cta-secondary pull-right">
              <i className="fa fa-bars" aria-hidden="true"></i> Stats
            </button>
          </div>
        </div>
      </div>        
    )
  }
})