let SidebarQuiz = React.createClass({
  getInitialState() {
    return {
      quizProblems: [],
      checkedOptionIds: [],
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

  handleChange(e){
    let id = e.target.value;
    
    if (this.state.checkedOptionIds.indexOf(id) === -1) {
      let checkedOptionIds = React.addons.update(this.state.checkedOptionIds, {$push: [id]});
      this.setState({checkedOptionIds: checkedOptionIds});
    }
  },

  handleSubmit(e){
    e.preventDefault();

    $.ajax({
      dataType: 'JSON',
      type: 'POST',
      url: '',
      data: {
              quiz_submission: {
                quiz_problem_id: this.state.quizProblems[this.state.current_position],
                checked_options: this.state.checkedOptionIds
              }
            },
      success(data){
        this.setState({checkedOptionIds: [], current_position: this.state.current_position + 1})
      }
    });
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
                         handleChange={this.handleChange}
                         />
                  {option.content}
            </label>
          </div>
        )
      });

      return (
        <div>
          <div className="row">
            <div className="col-xs-12">
              <div dangerouslySetInnerHTML={{__html: this.state.quizProblems[this.state.current_position].question}} />
            </div>
          </div>

          <div className="row">
            <div className="col-xs-12 col-md-offset-8 col-md-4">
              <small className="pull-right">
                {this.state.quizProblems.length - this.state.current_position} problems left!
              </small>
            </div>
            <div className="col-xs-12">
              {options}
            </div>
          </div>

          <div className="row">        
            <div className="col-md-offset-8 col-md-4">
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