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

  handleDeleteQuiz(deletedQuiz) {
    console.log(deletedQuiz.course_name);
    console.log(this.state.quizProblems);

    let quizProblemObj = _.find(this.state.quizProblems, (problem) => {
      return problem.course_name == deletedQuiz.course_name;
    });

    console.log(quizProblemObj);

    let quizProblems = quizProblemObj.quiz_problems.filter((quiz_problem) => {
      return quiz_problem.id !== deletedQuiz.id;
    });

    this.setState({quizProblems: quizProblems});
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