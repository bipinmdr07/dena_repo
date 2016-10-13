let QuizOptionForm = React.createClass({
  getInitialState() {
      return {
          content: ''
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

  render() {
    return (
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
        <div className="checkbox">
          <label><input type="checkbox" name="correct" value="true" />Correct</label><br />
          <label><input type="checkbox" name="correct" value="false" defaultChecked />Incorrect</label>
        </div>    

      </div>
    )
  }
})