let QuizCategoryForm = React.createClass({
  getInitialState() {
      return {
        editing: false,
        name: '',
        category: '',
        quizCategories: []
      };
  },

  componentDidMount() {
    $.getJSON('/admin/quiz_categories', (result) => {      
      this.setState({quizCategories: result});
    });
  },

  quizCategories() {
    
  },

  handleSubmit(e){
    e.preventDefault();
    $.ajax({
      url: `/admin/quiz_categories`,
      type: 'POST',
      dataType: 'JSON',
      data: { quiz_category: { name: this.state.name } },
      context: this,
      success(data) {
        this.setState({editing: false, name: '', category: ''});
        let quizCategories = React.addons.update(this.state.quizCategories, {$push: [data]});
        this.setState({quizCategories: quizCategories});
      }
    });
  },

  handleNameChange(e){
    this.setState({name: e.target.value});
  },

  handleCategoryChange(e){
    this.props.handleCategoryChange(e.target.value);
  },

  render(){
    let quizCategories = this.state.quizCategories.map((category) => {
      return (
        <option key={category.id} value={category.id}>{category.name}</option>
      )
    });

    return (
      <div className="row">
        <div className="col-xs-12 col-md-6"> 
          <div className="form-group" onChange={this.handleCategoryChange}>
            <label>Select category</label>
            <select className="form-control" id="quiz_category">
              {quizCategories}
            </select>
          </div>
        </div>
        
        <div className="col-xs-12 col-md-6">
          <div className="form-group">            
            <div className="row">
              <div className="col-xs-12">
                <label>Create category</label>
              </div>
              <div className="col-xs-9">
                <input type="text" name="name" value={this.state.name} onChange={this.handleNameChange} placeholder="New Category" className="form-control" />
              </div>

              <div className="col-xs-3">
                <button className="btn btn-cta-primary" onClick={this.handleSubmit} disabled={!this.state.name}>+</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
})