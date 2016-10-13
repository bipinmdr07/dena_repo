let SidebarQuiz = React.createClass({
  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  render() {
    return (
      <form className="sidebar-form" style={this.sidebarFormStyles()}>
        <h3>
          There are no quizzes for this lesson!
        </h3>
      </form>       
    )
  }
});