let AdminQuizProblems = React.createClass({
  getInitialState() {
    return {
      quizProblems: [],
      displayedQuizzes: [],
      topNavHtml: []
    };
  },

  componentDidMount() {
    $.ajax({
      dataType: 'JSON',
      url: '/admin/quiz_problems.json',
      context: this,
      success(data) {
        this.setState({quizProblems: data});
        this.setQuizProblems(data);
        this.setTopNav(data);
      }
    });
  },

  setTopNav(quizProblems){    
    let topNavHtml = [];

    quizProblems.forEach((quizProblem) => {
      topNavHtml.push(<li key={`li-${quizProblem.course_name}`}><a onClick={this.handleCourseChange} data-course-name={quizProblem.course_name}>{quizProblem.course_name}</a></li>)
    });

    this.setState({topNavHtml: topNavHtml});

  },

  handleCourseChange(e){
    let course_name = $(e.target).data('course-name');
    
    let quizProblems = this.state.quizProblems.filter((quizProblem) => {
      return quizProblem.course_name == course_name
    });

    let quizProblemsHtml = this.generateQuizHtml(quizProblems);


    this.setState({displayedQuizzes: quizProblemsHtml});
  },

  generateQuizHtml(quizProblems){
    let quizProblemsHtml = [];

    quizProblems.forEach((object) => {
      quizProblemsHtml.push(<h1 key={object.course_name} className="text-center" style={{"clear": "both"}}>{object.course_name}</h1>);
      object.quiz_problems.map((quiz_problem) => {
        quizProblemsHtml.push(<AdminQuizProblem key={quiz_problem.id} quizProblem={quiz_problem} handleDeleteQuiz={this.handleDeleteQuiz}/>);
      })
    });

    return quizProblemsHtml;
  },

  setQuizProblems(quizProblems){    
    let quizProblemsHtml = this.generateQuizHtml(quizProblems);

    let displayedQuizzes = React.addons.update(this.state.displayedQuizzes, {$push: quizProblemsHtml});
    this.setState({displayedQuizzes: displayedQuizzes});
  },

  render(){
    return (
      <div>
        <ul className="nav nav-pills">
          {this.state.topNavHtml}
        </ul>
        <div className="row">
          {this.state.displayedQuizzes}
        </div>
      </div>
    )
  }
});