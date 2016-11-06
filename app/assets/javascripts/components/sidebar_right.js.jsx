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
          sidebarFormWidth: this.sidebarFormWidth(),
          quizProblems: [],
          checkedOptionIds: [],
          currentPosition: 0,
          showAnswers: false,
          totalScore: 0,
          averageScore: 0,
          quizCompleted: this.props.quizCompleted
      };
  },

  componentWillMount() {
    this.calculateLessonContentWidth();
  },

  componentDidMount() {
    window.addEventListener('resize', this.handleResize);

    $.ajax({
      dataType: 'JSON',
      url: '/quiz_problems.json',
      data: {lesson_id: this.props.lesson_id, course_name: this.props.course_name},
      context: this,
      success(data) {
        this.setState({quizProblems: data});
      }
    });

    $(document).bind('click', this.clickDocument);
  },

  componentWillUnmount() {
    $(document).unbind('click', this.clickDocument);
  },

  clickDocument: function(e) {
      let component = ReactDOM.findDOMNode(this.refs.component);
      if (!(e.target == component || $(component).has(e.target).length)) {          
        this.setState({showFlashcard: false, showQuestion: false, showQuiz: false, showAdminQuiz: false, showNav: false}, () => {
          this.slide();
        }); 
      } 
  },

  halfWindowWidth(){
    return $(window).width() / 2;
  },

  positionRight() {
    return -this.halfWindowWidth() + this.initialDisplayWidth();
  },

  initialDisplayWidth() {
    return 55;
  },

  sidebarLeftWidth(){
    return $(".sidebar_container_left").width();
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

  sidebarDisplayed(){
    return (this.state.showFlashcard || this.state.showQuestion || this.state.showQuiz || this.state.showAdminQuiz || this.state.showNav);
  },

  handleResize(){ 
    if (this.sidebarDisplayed()){
      this.setState({
        containerWidth: this.halfWindowWidth(),
        initialDisplayWidth: this.initialDisplayWidth(),
        sidebarFormWidth: this.sidebarFormWidth()
      });

    } else {
      this.setState({
        containerWidth: this.halfWindowWidth(),
        containerRight: this.positionRight(),
        initialDisplayWidth: this.initialDisplayWidth(),
        sidebarFormWidth: this.sidebarFormWidth()
      });
    }

    this.calculateLessonContentWidth();
  },

  lessonContentPadding(){
    return 40;
  },

  calculateLessonContentWidth(){
    $(".lesson_content").css("position", "absolute");
    $(".lesson_content").css("left", this.sidebarLeftWidth() + this.lessonContentPadding());
    $(".lesson_content").css("right", this.sidebarLiWidth().width + this.lessonContentPadding());
  },

  slide(){
    if (this.sidebarDisplayed()) {
      $('.lesson_content').css('left', "20px"); 
      $('.lesson_content').css('width', this.halfWindowWidth() - 40); 

      $('.sidebar_container_right').css('right', '0px');
      $('.sidebar_container_left').css('left', -this.sidebarFormWidth() + "px"); 
    } else {

      this.calculateLessonContentWidth();
      $('.lesson_content').css('width', "initial"); 
      $('.sidebar_container_right').css('right', this.positionRight() + "px");
      $('.sidebar_container_left').css('left', "0px");
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
                              sidebarFormWidth={this.state.sidebarFormWidth}
                              quizProblems={this.state.quizProblems}
                              checkedOptionIds={this.state.checkedOptionIds}
                              currentPosition={this.state.currentPosition}
                              showAnswers={this.state.showAnswers}
                              averageScore={this.state.averageScore}
                              handleCheckedOptionIdsChange={this.handleCheckedOptionIdsChange}
                              handleQuizSubmission={this.handleQuizSubmission}
                              handleNextQuestion={this.handleNextQuestion}
                              handleFinishQuiz={this.handleFinishQuiz}
                              quizCompleted={this.state.quizCompleted}
                              handleRetakeQuiz={this.handleRetakeQuiz} />
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
    if (this.state.initialDisplayWidth > 80) {
      return (
        <div>
          Create New Flashcard
        </div>
      )
    }
  },

  questionText(){
    if (this.state.initialDisplayWidth > 80) {
      return (
        <div>
          Ask Question
        </div>
      )
    }
  },

  quizText(){
    if (this.state.initialDisplayWidth > 80) {
      return (
        <div>
          Quizzes
        </div>
      )
    }
  },

  adminQuizText(){
    if (this.state.initialDisplayWidth > 80) {
      return (
        <div>
          Add Quiz
        </div>
      )
    }
  },

  adminQuiz(){
    if (this.props.user_is_admin) {
      return (
        <li className={this.state.showAdminQuiz ? "sidebar-active" : "" } onClick={this.toggleAdminQuiz} style={this.sidebarLiWidth()}>
          <i className="fa fa-plus" aria-hidden="true"></i>
          {this.adminQuizText()}
        </li>
      )
    }
  },

  handleCheckedOptionIdsChange(id){
    if (this.state.checkedOptionIds.indexOf(id) === -1) {
      let checkedOptionIds = React.addons.update(this.state.checkedOptionIds, {$push: [id]});
      this.setState({checkedOptionIds: checkedOptionIds});
    } else {
      let checkedOptionIds = this.state.checkedOptionIds.filter((optionId) => {
        return optionId !== id; 
      });
      this.setState({checkedOptionIds: checkedOptionIds});
    }
  },

  handleQuizSubmission(data){
    totalScore = this.state.totalScore + data.score
    averageScore = totalScore / (this.state.currentPosition + 1);
    this.setState({showAnswers: true, averageScore: averageScore, totalScore: totalScore});
  },

  handleFinishQuiz(){
    this.setState({quizCompleted: true});
  },

  handleNextQuestion(){
    this.setState({currentPosition: this.state.currentPosition + 1, showAnswers: false, checkedOptionIds: []});
  },

  handleRetakeQuiz(){
    $.ajax({
      dataType: 'JSON',
      url: '/quiz_problems.json',
      data: {lesson_id: this.props.lesson_id, course_name: this.props.course_name},
      context: this,
      success(data) {
        this.setState({quizProblems: data, currentPosition: 0, showAnswers: false, totalScore: 0, averageScore: 0});
      }
    });
  },

  render(){
    return(
      <div className="sidebar_container sidebar_container_right" style={this.sidebarContainerStyles()} ref="component">
        <ul className="nav nav-pills nav-stacked left-menu sidebar sidebar-right" style={this.sidebarLiWidth()}>
          <li className={this.state.showFlashcard ? "sidebar-sm-icon sidebar-active" : "sidebar-sm-icon" } onClick={this.toggleFlashcard} style={this.sidebarLiWidth()}>
            <i className="fa fa-pencil-square-o" aria-hidden="true"></i>
            
          </li>

          <li className={this.state.showQuestion ? "sidebar-sm-icon sidebar-active" : "sidebar-sm-icon" }  onClick={this.toggleQuestion} style={this.sidebarLiWidth()}>
            <i className="fa fa-question-circle" aria-hidden="true"></i>
            
          </li>

          <li className={this.state.showQuiz ? "sidebar-sm-icon sidebar-active" : "sidebar-sm-icon" } onClick={this.toggleQuiz} style={Object.assign(this.sidebarLiWidth(), {color: this.state.quizCompleted ? "#ffffff" : "#ec6952"})}>
            <i className="fa fa-check-square" aria-hidden="true"></i>
            
          </li>

          {this.adminQuiz()}
          
        </ul>

        {this.sidebarForm()}

      </div>
    )
  }
})