let AdminQuizProblem = React.createClass({
  render(){
    let options = this.props.quizProblem.quiz_options.map((option) => {
      return <AdminQuizOption key={option.id} quizOption={option} />
    });

    return (
      <div className="col-xs-12 col-md-4">
        <div className="admin-quiz-problem">
          <div dangerouslySetInnerHTML={{__html: this.props.quizProblem.question}} />

          {options}
        </div>
      </div>
    )
  }
})