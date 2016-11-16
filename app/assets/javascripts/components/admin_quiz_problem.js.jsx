let AdminQuizProblem = React.createClass({
  getInitialState() {
    return {
      edit: false,
      question: this.props.quizProblem.question,
      showOptions: true,
      quizCategoryId: this.props.quizProblem.quiz_category_id
    };
  },

  handleCategorySubmit(data){
    this.props.handleCategorySubmit(data);
  },  

  handleCategoryChange(id){
    this.setState({quizCategoryId: id});
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
        quiz_problem: { question: this.refs.question.value, quiz_category_id: this.state.quizCategoryId }
      },
      success: function(data) {
        this.setState({edit: false, question: data});   
      }
    })
  },

  quizProblem(){
    if (this.state.edit) {
      return (
        <form className="form-group">
          <textarea defaultValue={this.state.question} ref="question" className="form-control" rows="10" />

          <AdminQuizCategoryForm quizCategories={this.props.quizCategories} quizCategoryId={this.state.quizCategoryId} handleCategorySubmit={this.handleCategorySubmit} handleCategoryChange={this.handleCategoryChange}/>

          <br />

          <div className="btn-group">
            <button className="btn btn-cta-primary" onClick={this.handleEdit}>Submit</button>
            <button className="btn btn-cta-secondary" onClick={this.handleToggle}>Cancel</button>
          </div>
        </form>
      )
    } else {
      return (
        <div style={{"marginBottom": "30px"}}>
          <div onClick={this.handleToggle} style={{"marginTop": "30px"}} dangerouslySetInnerHTML={{__html: this.state.question}} />
          <label className="label label-success">{this.props.quizProblem.quiz_category.name}</label>
        </div>
      )
    }
  },

  options(){
    if (this.state.showOptions) {
      let options = this.props.quizProblem.quiz_options.map((option) => {
        return <AdminQuizOption key={option.id} quizOption={option} />
      });

      return options;
    }
  },

  quizProblemOptions(){
    if (!this.state.edit) {
      return (
        <div className="btn-group" style={{"position": "absolute", "right": "20px", "bottom": "0px"}}>
          <button className="btn btn-sm btn-cta-primary" onClick={this.toggleShowOptions}>Options</button>
          <a className="btn btn-sm btn-cta-secondary" href={`/admin/quiz_problems/${this.props.quizProblem.id}`} data-method="delete" data-confirm="Are you sure?">Delete</a>
        </div>
      )
    }
  },

  toggleShowOptions(e){
    e.preventDefault();
    this.setState({showOptions: !this.state.showOptions});
  },

  render(){
    return (
        <div className="admin-quiz-problem">
          <div style={{"position": "relative", "minHeight": "100px"}}>
            <p className="pull-right"><small>Lesson {this.props.quizProblem.lesson_id}</small></p>
            {this.quizProblem()}
                    
            {this.quizProblemOptions()}
          </div>

          <hr />
          <ul className="admin_quiz_options">
            {this.options()}
          </ul>
        </div>

    )
  }
})