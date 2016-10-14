let QuizOptionForm = React.createClass({
  getInitialState() {
      return {
          content: '',
          correct: ''
      };
  },

  handleChange(e){
    this.setState({content: e.target.value});
  },

  handleAddOption(e){
    e.preventDefault();
    this.props.handleAddOption();
  },

  handleDeleteOption(e){
    e.preventDefault();
    if (confirm("Are you sure you want to delete this option?")) {
      this.props.handleDeleteOption(this.props.id);  
    }  
  },

  handleToggleCorrect(e){
    this.setState({correct: e.target.value})
  },

  render() {
    return (
      <div className="row">
        <div className="col-xs-12">
          <div className="option_form_container">
            <a className="delete_option" onClick={this.handleDeleteOption}><i className="fa fa-minus-circle" aria-hidden="true"></i></a>        
            <br/>
            <textarea name="content" 
                      value={this.state.content} 
                      ref="content" 
                      className="form-control" 
                      onChange={this.handleChange} 
                      rows="2"
                      placeholder="Option for quiz" />


            <br />
            <div className="radio" onChange={this.handleToggleCorrect}>
              <label className="radio-inline"><input type="radio" name={"correct_" + this.props.id} value="true" />Correct</label>
              <label className="radio-inline"><input type="radio" name={"correct_" + this.props.id} value="false" defaultChecked />Incorrect</label>
            </div>    
          </div>
        </div>
      </div>
    )
  }
})