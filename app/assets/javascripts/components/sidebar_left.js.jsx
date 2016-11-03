let SidebarLeft = React.createClass({
  getInitialState() {
    return {
      courses: []
    };
  },

  componentDidMount() {
    $.ajax({
      dataType: 'JSON',
      url: `/tracks/${this.props.track.number}.json`,
      context: this,
      success(data) {       
        this.setState({courses: data.courses});        
      }
    });
  },

  render(){
    
    let courses = Object.keys(this.state.courses).map((course) => {
      return <SidebarLeftCourse key={this.state.courses[course].course_url} 
                                course={this.state.courses[course]} 
                                course_name={this.props.course_name}
                                chapter_title={this.props.chapter_title}
                                lesson_id={this.props.lesson_id}/>
    });

    return(
      <ul className="nav nav-pills nav-stacked left-menu sidebar sidebar-left" id="sidebar-reveal-nav">

        <li><a href="/courses"><i className="fa fa-home" aria-hidden="true"></i> <span className="nav-text">All Courses</span></a></li>

        <li className="track-title-nav">Track {this.props.track.number}: {this.props.track.title}</li>
        {courses}        
      </ul>
    )
  }

});