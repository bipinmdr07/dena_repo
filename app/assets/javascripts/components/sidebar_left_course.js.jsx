let SidebarLeftCourse = React.createClass({
  getInitialState() {
    return {
      show: this.props.course_name == this.props.course.course
    }
  },

  handleClick(e){
    e.preventDefault();
    this.setState({show: !this.state.show});
  },

  render(){

    let chapters = [];
    if (this.state.show) {
      chapters = this.props.course.chapters.map((chapter) => {
        return <SidebarLeftChapter key={chapter.title} 
                                   chapter={chapter} 
                                   course={this.props.course} 
                                   chapter_title={this.props.chapter_title}
                                   lesson_id={this.props.lesson_id}/>
      });
    }

    return(     
        <div>   
          <li className="course-title">
            <a href="#" onClick={this.handleClick} style={{color: this.state.show ? "white" : "#5c5c5c" }}>
              {this.props.course.course_name}
            </a>
          </li>
              
          {chapters}
        </div>
    )
  }

});