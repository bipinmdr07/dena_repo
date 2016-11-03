let SidebarLeftLesson = React.createClass({
  render(){
    let liClass = "";

    if (this.props.show && (this.props.lesson_id == this.props.lesson.id)) {
      liClass = "active";
    }

    return(        
      <li className={liClass}>
        <a href={`${this.props.course.course_url}/${this.props.lesson.id}`} className="lesson-li" style={{"color": "#5a5a5a"}}>
          {`${this.props.lesson.id}. ${this.props.lesson.title}`}
        </a>
      </li>
    )
  }

});