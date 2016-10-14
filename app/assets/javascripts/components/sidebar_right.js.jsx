let SidebarRight = React.createClass({
  getInitialState() {
      return {
          showFlashcard: false,
          showQuestion: false,
          showQuiz: false,
          showAdminQuiz: false,
          showNav: false,
          containerWidth: this.halfWindowWidth(),
          containerRight: this.positionRight(),
          initialDisplayWidth: this.initialDisplayWidth(),
          sidebarFormWidth: this.sidebarFormWidth()
      };
  },

  componentDidMount() {
    window.addEventListener('resize', this.handleResize);
  },

  halfWindowWidth(){
    return $(window).width() / 2;
  },

  positionRight() {
    return -this.halfWindowWidth() + this.initialDisplayWidth();
  },

  initialDisplayWidth() {
    return $(window).width() / 8.88 - 30;
  },

  sidebarFormWidth() {
    return this.halfWindowWidth() - this.initialDisplayWidth();
  },

  sidebarContainerStyles() {
    return { width: this.state.containerWidth, right: this.state.containerRight }
  },
  sidebarLiWidth() {
    return { width: this.state.initialDisplayWidth };
  },

  handleResize(){    
    this.setState({
      containerWidth: this.halfWindowWidth(),
      containerRight: this.positionRight(),
      initialDisplayWidth: this.initialDisplayWidth(),
      sidebarFormWidth: this.sidebarFormWidth()
    })
  },

  slide(){
    if (this.state.showFlashcard || this.state.showQuestion || this.state.showQuiz || this.state.showAdminQuiz || this.state.showNav) {
      $('.lesson_content').css('margin-right', this.sidebarFormWidth() + "px"); 
      $('.sidebar_container_right').css('right', '0px');
    } else {
      $('.lesson_content').css('margin-right', "0px");
      $('.sidebar_container_right').css('right', this.positionRight() + "px");
    }

  },

  toggleFlashcard(){
    this.setState({showFlashcard: !this.state.showFlashcard, showQuestion: false, showQuiz: false, showAdminQuiz: false, showNav: false}, () => {
      this.slide();
    });    
    
  },

  toggleQuestion(){
    this.setState({showQuestion: !this.state.showQuestion, showFlashcard: false, showQuiz: false, showAdminQuiz: false, showNav: false}, () => {
      this.slide();
    });    
  },

  toggleQuiz(){
    this.setState({showQuiz: !this.state.showQuiz, showQuestion: false, showFlashcard: false, showAdminQuiz: false, showNav: false}, () => {
      this.slide();
    });    
  },

  toggleAdminQuiz(){
    this.setState({showAdminQuiz: !this.state.showAdminQuiz, showQuiz: false, showQuestion: false, showFlashcard: false, showNav: false}, () => {
      this.slide();
    }); 
  },

  toggleNav(){
    this.setState({showQuestion: !this.state.showNav, showFlashcard: false, showQuestion: false, showQuiz: false}, () => {
      this.slide();
    });    
  },

  sidebarForm(){
    if (this.state.showFlashcard) {
      return (
        <SidebarFlashcardForm authenticity_token={this.props.authenticity_token} 
                              lesson_id={this.props.lesson_id}
                              course_name={this.props.course_name}
                              lesson_url={this.props.lesson_url}
                              handleSubmit={this.toggleFlashcard}
                              sidebarFormWidth={this.state.sidebarFormWidth} />
      )
    } else if (this.state.showQuestion) {
      return (
        <SidebarQuestionForm authenticity_token={this.props.authenticity_token} 
                              lesson_id={this.props.lesson_id}
                              course_name={this.props.course_name}
                              handleSubmit={this.toggleQuestion}
                              sidebarFormWidth={this.state.sidebarFormWidth} />
      )
    } else if (this.state.showQuiz) {
      return (
        <SidebarQuiz authenticity_token={this.props.authenticity_token} 
                              lesson_id={this.props.lesson_id}
                              course_name={this.props.course_name}
                              handleSubmit={this.toggleQuiz}
                              sidebarFormWidth={this.state.sidebarFormWidth} />
      )
    } else if (this.state.showAdminQuiz) {
      return (
        <AdminQuizForm authenticity_token={this.props.authenticity_token} 
                              lesson_id={this.props.lesson_id}
                              course_name={this.props.course_name}
                              sidebarFormWidth={this.state.sidebarFormWidth}                              
                               />
      )
    }
  },

  flashcardText(){
    if (this.state.initialDisplayWidth > 70) {
      return (
        <div>
          Create New Flashcard
        </div>
      )
    }
  },

  questionText(){
    if (this.state.initialDisplayWidth > 70) {
      return (
        <div>
          Ask Question
        </div>
      )
    }
  },

  quizText(){
    if (this.state.initialDisplayWidth > 70) {
      return (
        <div>
          Quizzes
        </div>
      )
    }
  },

  adminQuizText(){
    if (this.state.initialDisplayWidth > 70) {
      return (
        <div>
          Add Quiz
        </div>
      )
    }
  },

  render(){
    return(
      <div className="sidebar_container sidebar_container_right" data-spy="affix" data-offset-bottom="40" style={this.sidebarContainerStyles()}>
        <ul className="nav nav-pills nav-stacked left-menu sidebar sidebar-right" style={this.sidebarLiWidth()}>
          <li className={this.state.showFlashcard ? "sidebar-active" : "" } onClick={this.toggleFlashcard} style={this.sidebarLiWidth()}>
            <i className="fa fa-pencil-square-o" aria-hidden="true"></i>
            {this.flashcardText()}
          </li>

          <li className={this.state.showQuestion ? "sidebar-active" : "" }  onClick={this.toggleQuestion} style={this.sidebarLiWidth()}>
            <i className="fa fa-question-circle" aria-hidden="true"></i>
            {this.questionText()}
          </li>

          <li className={this.state.showQuiz ? "sidebar-active" : "" } onClick={this.toggleQuiz} style={this.sidebarLiWidth()}>
            <i className="fa fa-check-square" aria-hidden="true"></i>
            {this.quizText()}
          </li>

          <li className={this.state.showAdminQuiz ? "sidebar-active" : "" } onClick={this.toggleAdminQuiz} style={this.sidebarLiWidth()}>
            <i className="fa fa-plus" aria-hidden="true"></i>
            {this.adminQuizText()}
          </li>
        </ul>

        {this.sidebarForm()}

      </div>
    )
  }
})