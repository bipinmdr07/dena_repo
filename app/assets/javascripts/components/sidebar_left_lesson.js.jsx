let SidebarLeftLesson = React.createClass({
  render(){
    let liClass = "";

    if (this.props.show && (this.props.lesson_id == this.props.lesson.id)) {
      liClass = "active";
    }

    return(        
      <li className={liClass}>
        <a href={`${this.props.course.course_url}/${this.props.lesson.id}`} className="lesson-li" style={{"color": "#5a5a5a"}}>
          <span>{`${this.props.lesson.id}. ${this.props.lesson.title}`}</span>
          <span style={{"position": "absolute", "right": "10px"}}><i className="fa fa-check-square-o progression_check" aria-hidden="true"></i></span>
        </a>
      </li>
    )
  }

});