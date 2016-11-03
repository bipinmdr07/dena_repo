let SidebarLeftChapter = React.createClass({
  getInitialState() {
    return {
      show: this.props.chapter_title == this.props.chapter.title
    }
  },

  handleClick(e){
    e.preventDefault();
    this.setState({show: !this.state.show});
  },

  render(){

    let lessons = [];
    if (this.state.show) {
      lessons = this.props.chapter.lessons.map((lesson) => {
        return <SidebarLeftLesson key={lesson.id} 
                                  lesson={lesson} 
                                  course={this.props.course}
                                  chapter_title={this.props.chapter_title}
                                  lesson_id={this.props.lesson_id}
                                  show={this.state.show}/>
      });
    }
    
    return(        
      <li>
        <a className="chapter-nav chapter-li" onClick={this.handleClick} aria-expanded={this.state.show}>
          {this.props.chapter.title}
        </a>

        <ul className="nav nav-stacked left-submenu chapter-ul" style={{"position": "relative"}}>
          {lessons}
        </ul>
      </li>
    )
  }

});