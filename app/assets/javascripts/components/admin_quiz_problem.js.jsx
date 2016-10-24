let AdminQuizProblem = React.createClass({
  getInitialState() {
    return {
      edit: false,
      question: this.props.quizProblem.question
    };
  },

  handleToggle(e){
    e.preventDefault();
    this.setState({edit: !this.state.edit});
  },

  handleEdit(e){
    e.preventDefault();
    $.ajax({
      url: `/admin/quiz_problems/${this.props.quizProblem.id}`,
      dataType: 'JSON',
      type: 'PATCH',
      context: this,
      data: {
        quiz_problem: { question: this.refs.question.value }
      },
      success: function(data) {
        this.setState({edit: false, question: data});   
      }
    })
  },

  quizProblem(){
    if (this.state.edit) {
      return (
        <form>
          <textarea defaultValue={this.state.question} ref="question" className="form-control" rows="10" />

          <div className="btn-group">
            <button className="btn btn-cta-primary" onClick={this.handleEdit}>Submit</button>
            <button className="btn btn-cta-secondary" onClick={this.handleToggle}>Cancel</button>
          </div>
        </form>
      )
    } else {
      return (
        <div onClick={this.handleToggle} dangerouslySetInnerHTML={{__html: this.state.question}} />
      )
    }
  },

  render(){
    let options = this.props.quizProblem.quiz_options.map((option) => {
      return <AdminQuizOption key={option.id} quizOption={option} />
    });

    return (
      <div className="col-xs-12 col-md-4">
        <div className="admin-quiz-problem">
          {this.quizProblem()}

          <hr />
          <ul>
            {options}
          </ul>
        </div>
      </div>
    )
  }
})