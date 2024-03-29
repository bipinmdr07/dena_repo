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

  courseNameText(){
    if (!this.props.displaySm) {
      return this.props.course.course_name;
    }
  },

  render(){

    let chapters = [];
    if (this.state.show) {
      chapters = this.props.course.chapters.map((chapter) => {
        return <SidebarLeftChapter key={chapter.title} 
                                   chapter={chapter} 
                                   course={this.props.course} 
                                   chapter_title={this.props.chapter_title}
                                   lesson_id={this.props.lesson_id}
                                   displaySm={this.props.displaySm}/>
      });
    }

    return(     
        <div>   
          <li className="course-title">
            <a href="#" onClick={this.handleClick} style={{color: this.state.show ? "white" : "#5c5c5c" }}>
              <i className="fa fa-file-code-o" style={{"marginRight": "10px"}} aria-hidden="true"></i> {this.courseNameText()}
            </a>
          </li>
              
          {chapters}
        </div>
    )
  }

});