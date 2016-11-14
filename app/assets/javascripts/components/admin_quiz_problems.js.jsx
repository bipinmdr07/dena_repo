let AdminQuizProblems = React.createClass({
  getInitialState() {
    return {
      quizProblems: [],
      displayedQuizzes: [],
      topNavHtml: [],
      quizCategories: [],
      currentCourse: []
    };
  },

  componentDidMount() {
    $.ajax({
      dataType: 'JSON',
      url: '/admin/quiz_problems.json',
      context: this,
      success(data) {
        this.setState({quizProblems: data});
        // this.setQuizProblems(data);
        this.setState({currentCourse: [data[0]] });
        this.setTopNav(data);
      }
    });

    $.getJSON('/admin/quiz_categories', (result) => {      
      this.setState({quizCategories: result});
    });  
  },

  setTopNav(quizProblems){    
    let topNavHtml = [];

    quizProblems.forEach((quizProblem) => {
      topNavHtml.push(<li key={`li-${quizProblem.course_name}`}><a onClick={this.handleCourseChange} data-course-name={quizProblem.course_name}>{quizProblem.course_name}</a></li>)
    });

    this.setState({topNavHtml: topNavHtml});

  },

  handleCategorySubmit(data){      
    let quizCategories = React.addons.update(this.state.quizCategories, {$push: [data]});
    this.setState({quizCategories: quizCategories});
  },

  handleCourseChange(e){
    let course_name = $(e.target).data('course-name');
    
    let quizProblems = this.state.quizProblems.filter((quizProblem) => {
      return quizProblem.course_name == course_name
    });


    this.setState({currentCourse: quizProblems});
  },

  render(){
    let quizCategories = this.state.quizCategories.map((o) => {
      return <li>{o.name}</li>
    });

    let quizProblemsHtml = [];

    this.state.currentCourse.forEach((object) => {
      quizProblemsHtml.push(<h1 key={object.course_name} className="text-center" style={{"clear": "both"}}>{object.course_name}</h1>);
      object.quiz_problems.map((quiz_problem) => {
        quizProblemsHtml.push(<AdminQuizProblem key={quiz_problem.id} quizProblem={quiz_problem} handleDeleteQuiz={this.handleDeleteQuiz} quizCategories={this.state.quizCategories} handleCategorySubmit={this.handleCategorySubmit}/>);
      })
    });

    let lessons = this.state.currentCourse.forEach((object) => {
      return <li>Lesson {object.lesson_id}</li>
    });

    return (
      <div>
        <ul className="nav nav-pills">
          {this.state.topNavHtml}
        </ul>

        <ul className="nav nav-pills">
          {lessons}
        </ul>

        <div className="row">
          {quizProblemsHtml}
        </div>
      </div>
    )
  }
});