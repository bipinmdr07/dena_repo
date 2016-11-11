let FinishQuiz = React.createClass({
  render(){
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

            <button onClick={this.props.handleToggleStats} className="btn btn-sm btn-cta-secondary pull-right">
              <i className="fa fa-bars" aria-hidden="true"></i> Stats
            </button>
          </h2>

          <hr />

          <p key={"message_" + this.props.averageScore}>
            {this.props.averageScore >= this.props.passingGrade ? "Congratulations! You've passed the quizzes." : `You must score at least ${this.props.passingGrade} to pass. Take the quiz again to mark this lesson as completed!`}
          </p>

          <br />

          <button onClick={this.props.handleRetakeQuiz} className="btn btn-cta-primary pull-right">
            <i className="fa fa-repeat" aria-hidden="true"></i> Retake Quiz
          </button>            

        </ReactCSSTransitionGroup>
      </div>
    )
  }
})