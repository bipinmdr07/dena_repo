let QuizCategoryForm = React.createClass({
  getInitialState() {
      return {
        editing: false,
        name: '',
        quizCategories: []
      };
  },

  componentDidMount() {
    $.get('/admin/quiz_categories', (result) => {
      this.setState({quizCategories: result});
    });
  },

  quizCategories() {
    this.state.quizCategories.map((category) => {
      return (
        <option>{category}</option>
      )
    });
  },

  handleSubmit(e){
    e.preventDefault();
    $.ajax({
      url: `/admin_quiz_categories/`,
      type: 'POST',
      dataType: 'JSON',
      data: { quiz_category: { name: this.state.name } },
      context: this,
      success(data) {
        this.setState({editing: false, name: ''});
        let quizCategories = React.addons.update(this.state.quizCategories, {$push: [data]});
        this.setState({quizCategories: quizCategories});
      }
    });
  },

  render(){
    return (
      <div className="row">
        <div className="col-xs-12 col-md-6"> 
          <div className="form-group">
            <label for="quiz_category">Select category:</label>
            <select class="form-control" id="quiz_category">
              {this.quizCategories()}
            </select>
          </div>
        </div>
        
        <div className="col-xs-12 col-md-6">
          <div className="form-group">
            <input type="text" name="name" value={this.state.name} placeholder="New Category" className="form-control" />
            <button className="btn btn-cta-primary" onClick={this.handleSubmit} disabled={!this.state.name}>Create New Category</button>
          </div>
        </div>
      </div>
    )
  }
})