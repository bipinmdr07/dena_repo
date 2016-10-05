let QuestionForm = React.createClass({
  getInitialState() {
      return {
          content: ''  
      };
  },

  handleChange(e){
    this.setState({content: e.target.value});
  },

  handleSubmit(e){
    e.preventDefault();
    $.ajax({
      url: `/questions/${this.props.question_id}/replies`,
      type: 'POST',
      data: { reply: this.state },
      context: this,
      success(data) {
        this.props.handleNewReply(data);
        this.setState(this.getInitialState());
      }
    })
  },

  render() {
    return (
      <div> 
        <form>
          <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />
          <textarea name="content" ref="content" className="form-control" onChange={this.handleChange} />
          <button className="btn btn-cta-primary" onClick={this.handleSubmit} disabled={!this.state.content}>Submit</button>
        </form>
      </div>
    )
  }
});