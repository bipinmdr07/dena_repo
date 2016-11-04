let SidebarLeftLesson = React.createClass({
  lessonStyles(){
    if (this.props.lesson.completed) {
      return {"color": "rgb(92, 184, 92)"}
    }
  },  

  lessonNameText(){
    if (this.props.displaySm) {
      return <span style={this.lessonStyles()}>{this.props.lesson.id}</span>;      
    } else {
      return <span>{this.props.lesson.id}. {this.props.lesson.title}</span>;
    }
  },

  lessonProgress(){
    if (!this.props.displaySm && this.props.lesson.completed) {
      return (
        <span style={{"position": "absolute", "right": "15px"}}>
          <i className="fa fa-check-square-o progression_check" aria-hidden="true"></i>
        </span>
      )
    }
  },

  lessonStyles(){
    if (this.props.displaySm && this.props.lesson.completed) {
      return {"color": "#5cb85c", "textAlign": "center", "padding": "10px", "fontFamily": 'Lato, sans-serif'}
    } else if (this.props.displaySm) {
      return {"color": "#5a5a5a", "textAlign": "center", "padding": "10px", "fontFamily": 'Lato, sans-serif'}
    } else {
      return {"color": "#5a5a5a", "paddingLeft": "40px", "paddingRight": "35px", "fontFamily": 'Lato, sans-serif'}
    }
  },


  render(){
    let liClass = "";
    let liId = "";

    if (this.props.show && (this.props.lesson_id == this.props.lesson.id)) {
      liClass = "active";
      liId = "activeId"; 
    }

    return(        
      <li className={liClass} id={liId}>
        <a href={`${this.props.course.course_url}/${this.props.lesson.id}`} style={this.lessonStyles()}>
          {this.lessonNameText()}
          {this.lessonProgress()}
        </a>
      </li>
    )
  }

});