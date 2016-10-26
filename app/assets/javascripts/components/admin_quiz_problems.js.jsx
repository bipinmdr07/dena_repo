let AdminQuizProblems = React.createClass({
  getInitialState() {
    return {
      quizProblems: []
    };
  },

  componentDidMount() {
    $.ajax({
      dataType: 'JSON',
      url: '/admin/quiz_problems.json',
      context: this,
      success(data) {
        this.setState({quizProblems: data});
      }
    });
  },

  render(){
    let quizProblems = [];

    this.state.quizProblems.forEach((object) => {
      quizProblems.push(<h1 key={object.course_name} className="text-center" style={{"clear": "both"}}>{object.course_name}</h1>);
      object.quiz_problems.map((quiz_problem) => {
        quizProblems.push(<AdminQuizProblem key={quiz_problem.id} quizProblem={quiz_problem} handleDeleteQuiz={this.handleDeleteQuiz}/>);
      })
    });

    return (
      <div className="row">
        {quizProblems}
      </div>
    )
  }
});