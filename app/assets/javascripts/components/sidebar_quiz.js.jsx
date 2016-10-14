let SidebarQuiz = React.createClass({
  getInitialState() {
    return {
      quizProblems: [],
      current_position: 0
    };
  },

  componentDidMount() {
    $.ajax({
      dataType: 'JSON',
      url: '/admin/quiz_problems.json',
      data: {lesson_id: this.props.lesson_id, course_name: this.props.course_name},
      context: this,
      success(data) {
        this.setState({quizProblems: data});
      }
    })
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  formContent(){
    if (this.state.quizProblems.length == 0) {
      return (
        <h3>There are no quizzes for this lesson!</h3>
      )
    } else {
      let options = this.state.quizProblems[this.state.current_position].quiz_options.map((option) => {
        return (
          <div key={option.id} className="checkbox">
            <label>
                  <input type="checkbox" 
                         name={this.state.quizProblems[this.state.current_position].id} 
                         value={option.id} 
                         />
                  {option.content}
            </label>
          </div>
        )
      });

      return (
        <div>
          <h3>{this.state.quizProblems[this.state.current_position].question}</h3>

          <div className="row">
            <div className="col-xs-12">
              {options}
            </div>
          </div>

          <div className="row">
            <div className="col-xs-4">
              {this.state.quizProblems.length - this.state.current_position} problems left!
            </div>

            <div className="col-xs-8 col-md-offset-4 col-md-4">
              <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit}>Submit Answer</button>
            </div>
          </div>
        </div>
      )
    }
  },

  render(){
    
    return (
      <form className="sidebar-form" style={this.sidebarFormStyles()}>
        {this.formContent()}
      </form>
    )
  }
});