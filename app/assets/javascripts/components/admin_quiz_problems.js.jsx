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
        let currentCourse = jQuery.extend(true, {}, data[0]);
        this.setState({quizProblems: data});        
        this.setState({currentCourse: [currentCourse] });
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
    e.preventDefault();
    let course_name = $(e.target).data('course-name');    

    let quizProblems = this.state.quizProblems.filter((quizProblem) => {
      return quizProblem.course_name == course_name
    });    

    // deep clone
    quizProblems = jQuery.extend(true, [], quizProblems);

    this.setState({currentCourse: quizProblems});
  },

  handleChangeLesson(e){ 
    e.preventDefault();   
    let lessonId = $(e.target).data('lesson-id');    
    let quiz_problems = [];

    let quizProblems = jQuery.extend(true, [], this.state.quizProblems);        

    let currentCourse = {}
    
    quizProblems.forEach((object) => {
      if (object.course_name != this.state.currentCourse[0].course_name) {
        return
      }
      object.quiz_problems.forEach((quizProblem) => {
        if (quizProblem.lesson_id == lessonId){
          quiz_problems.push(quizProblem);
        }
      });
      object.quiz_problems = quiz_problems;
      currentCourse = object;
    })    

    this.setState({currentCourse: [currentCourse]});
  },

  render(){
    let quizProblemsHtml = [];            

    this.state.currentCourse.forEach((object) => {
      quizProblemsHtml.push(<h1 key={object.course_name} className="text-center" style={{"clear": "both"}}>{object.course_name}</h1>);      

      object.quiz_problems.forEach((quiz_problem) => {
        quizProblemsHtml.push(<AdminQuizProblem key={object.course_name + quiz_problem.id} quizProblem={quiz_problem} handleDeleteQuiz={this.handleDeleteQuiz} quizCategories={this.state.quizCategories} handleCategorySubmit={this.handleCategorySubmit}/>);
      })
    });

    let lessonIds = [];

    if (this.state.currentCourse[0]) {
      let quizProblems = this.state.quizProblems.filter((quizProblem) => {
        return quizProblem.course_name == this.state.currentCourse[0].course_name
      });

      quizProblems.map((object) => {      
        object.quiz_problems.map((quiz_problem) => {
          lessonIds.push(quiz_problem.lesson_id)
        });
      });
    }

    let lessons = _.uniq(lessonIds).map((id) => {
      return <li><a onClick={this.handleChangeLesson} data-lesson-id={id}>Lesson {id}</a></li>
    })

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