let SidebarLeft = React.createClass({
  getInitialState() {
    return {
      courses: [],
      containerWidth: this.containerWidth(),
      displaySm: !($(window).width() > 930)
    };
  },

  componentDidMount() {
    
    window.addEventListener('resize', () => {
      console.log($(window).width());
      let resizeWidth;
      clearTimeout(resizeWidth);
      resizeWidth = setTimeout(this.handleResize(), 100);
    });

    $.ajax({
      dataType: 'JSON',
      url: `/tracks/${this.props.track.number}.json`,
      context: this,
      success(data) {       
        this.setState({courses: data.courses});   
        document.getElementById("activeId").scrollIntoView()
      }
    }); 
  },

  containerWidth(){
    return 25;
  },

  handleResize(){
    if ($(window).width() > 930) {      
      this.setState({containerWidth: this.containerWidth(), displaySm: false});
    } else {
      this.setState({displaySm: true});
      document.getElementById("activeId").scrollIntoView()
    }
  },

  sidebarLeftStyles(){
    if (this.state.displaySm) {
      return {width: 55 + "px"}      
    } else {
      return { width: this.state.containerWidth + "%" }
    }
  },

  trackText(){
    if (!this.state.displaySm) {
      return (<li className="track-title-nav">Track {this.props.track.number}: {this.props.track.title}</li>)
    }
  },

  homeText(){
    if (this.state.displaySm) {
      return {"padding": "20px 20px", "textAlign": "center"}
    }
  },

  courseText(){
    if (!this.state.displaySm) {
      return <span className="nav-text">All Courses</span>
    }
  },

  render(){
    
    let courses = Object.keys(this.state.courses).map((course) => {
      return <SidebarLeftCourse key={this.state.courses[course].course_url} 
                                course={this.state.courses[course]} 
                                course_name={this.props.course_name}
                                chapter_title={this.props.chapter_title}
                                lesson_id={this.props.lesson_id}
                                displaySm={this.state.displaySm}/>
    });

    return(
      <div className="sidebar_container sidebar_container_left" style={this.sidebarLeftStyles()}>
        <ul className="nav nav-pills nav-stacked left-menu sidebar sidebar-left" id="sidebar-reveal-nav">

          <li>
            <a href="/courses" style={this.homeText()}>
              <i className="fa fa-home" aria-hidden="true"></i> {this.courseText()}
            </a>
          </li>

          {this.trackText()}

          {courses}        
        </ul>
      </div>
    )
  }

});