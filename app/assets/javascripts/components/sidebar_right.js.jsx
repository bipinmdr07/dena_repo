let SidebarRight = React.createClass({
  getInitialState() {
      return {
          showFlashcard: false,
          showQuestion: false,
          showNav: false
      };
  },

  slideWidth: "350px",

  slide(){
    if (this.state.showFlashcard || this.state.showQuestion || this.state.showNav) {
      $('.lesson_content').css('margin-right', this.slideWidth); 
      $('.lesson_content').css('transition', 'all 700ms ease');
      $('.sidebar_container_right').css('right', '0px');
    } else {
      $('.lesson_content').css('margin-right', "0px");
      $('.sidebar_container_right').css('right', '-360px');
    }

  },

  toggleFlashcard(){
    this.setState({showFlashcard: !this.state.showFlashcard, showQuestion: false, showNav: false}, () => {
      this.slide();
    });    
    
  },

  toggleQuestion(){
    this.setState({showQuestion: !this.state.showQuestion, showFlashcard: false, showNav: false}, () => {
      this.slide();
    });    
  },

  toggleNav(){
    this.setState({showQuestion: !this.state.showNav, showFlashcard: false, showQuestion: false}, () => {
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
                              handleSubmit={this.toggleFlashcard} />
      )
    } else if (this.state.showQuestion) {
      return (
        <SidebarQuestionForm authenticity_token={this.props.authenticity_token} 
                              lesson_id={this.props.lesson_id}
                              course_name={this.props.course_name}
                              handleSubmit={this.toggleQuestion} />
      )
    }
  },

  render(){
    return(
      <div className="sidebar_container sidebar_container_right" data-spy="affix" data-offset-bottom="40" style={{ width: $(window).width() / 8.88 + 360 - 30 }}>
        <ul className="nav nav-pills nav-stacked left-menu sidebar sidebar-right" style={{ width: $(window).width() / 8.88 - 30 }}>
          <li className={this.state.showFlashcard ? "sidebar-active" : "" } onClick={this.toggleFlashcard}>
            <i className="fa fa-pencil-square-o" aria-hidden="true"></i><br />
            Create New Flashcard
          </li>
          <li className={this.state.showQuestion ? "sidebar-active" : "" }  onClick={this.toggleQuestion}>
            <i className="fa fa-question-circle" aria-hidden="true"></i><br />
            Ask Question
          </li>
          <li>
            <i className="fa fa-check-square" aria-hidden="true"></i><br />
            Quizzes
          </li>
        </ul>

        {this.sidebarForm()}

      </div>
    )
  }
})