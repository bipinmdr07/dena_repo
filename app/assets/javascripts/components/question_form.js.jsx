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
      dataType: 'JSON',
      data: { reply: this.state },
      context: this,
      success(data) {
        this.setState(this.getInitialState());
        this.props.handleNewReply(data);
      }
    })
  },

  render() {
    return (
      <div className="row">
        <div className="col-xs-12 col-md-6 col-md-offset-3"> 
          <form className="forum-forms">
            <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />
            <textarea name="content" 
                      value={this.state.content} 
                      ref="content" 
                      className="form-control" 
                      onChange={this.handleChange} 
                      rows="5"
                      placeholder="Write your reply in Markdown" />
            <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content}>Submit</button>
          </form>
        </div>
      </div>
    )
  }
});