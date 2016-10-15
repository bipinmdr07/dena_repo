let SidebarQuiz = React.createClass({
  getInitialState() {
    return {
      quizProblems: [],
      checkedOptionIds: [],
      current_position: 0,
      showAnswers: false,
      total_score: 0
    };
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
      url: '/quiz_submissions',
      context: this,
      data: {
              quiz_submission: {
                quiz_problem_id: this.props.quizProblems[this.state.current_position].id,
                checked_option_ids: this.state.checkedOptionIds
              }
            },
      success(data){
        totalScore = (this.state.totalScore + data.score) / this.state.current_position + 1;
        this.setState({checkedOptionIds: [], showAnswers: true, totalScore: totalScore});
      }
    });
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  optionStyles(option){
    if (this.state.showAnswers) {
      if (option.correct && this.refs["option_" + option.id].checked) {
        return { border: "1px solid green" }
      } else {
        return { border: "1px solid red" }
      }
    } 
  },

  handleNextQuestion(e){
    e.preventDefault();
    this.setState({current_position: this.state.current_position + 1, showAnswers: false});
  },

  formContent(){
    if (this.props.quizProblems.length == 0) {
      return (
        <h3>There are no quizzes for this lesson!</h3>
      )
    } else {
      let options = this.props.quizProblems[this.state.current_position].quiz_options.map((option) => {
        return (
          <div key={option.id} className="checkbox" style={this.optionStyles(option)}>
            <label>
                  <input type="checkbox" 
                         name={this.props.quizProblems[this.state.current_position].id} 
                         value={option.id} 
                         ref={"option_" + option.id}
                         onChange={this.handleChange}                         
                         />
                  {option.content}
            </label>
          </div>
        )
      });

      let actionButton;
      if (this.state.showAnswers) {
        actionButton = <button className="btn btn-cta-primary submit-btn" onClick={this.handleNextQuestion}>Next</button>
      }
      else {
        actionButton = <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit}>Submit Answer</button>            
      }      

      return (
        <div>
          <div className="row">
            <div className="col-xs-12">
              <div dangerouslySetInnerHTML={{__html: this.props.quizProblems[this.state.current_position].question}} />
            </div>
          </div>

          <div className="row">
            <div className="col-xs-12 col-md-offset-8 col-md-4">
              <small className="pull-right">
                {this.props.quizProblems.length - this.state.current_position} problems left!
              </small>
            </div>
            <div className="col-xs-12">
              {options}
            </div>
          </div>

          <div className="row">        
            <div className="col-md-offset-8 col-md-4">
              {actionButton}
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