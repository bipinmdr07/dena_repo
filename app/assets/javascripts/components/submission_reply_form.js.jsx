let SubmissionReplyForm = React.createClass({
  getInitialState() {
      return {
          content: '',
          preview: '',
          btnDisabled: false
      };
  },

  loadPreview: _.debounce(function(){
    $.ajax({
      url: '/markdown_previews',
      type: 'POST',
      dataType: 'JSON',
      data: { preview: { content: this.state.content }},
      context: this,
      success(data) {
        this.setState({preview: data});
        $("#preview").find("code").each(function(_, block) {
          hljs.highlightBlock(block);
        });
      } 
    });
  }, 300),

  highlightSyntax(){
    $('pre code').each(function(i, block) {
      hljs.highlightBlock(block);
    });   
  },

  handleChange(e){
    this.setState({content: e.target.value});
    this.loadPreview();
  },  

  handleSubmit(e){
    this.setState({btnDisabled: true});
    e.preventDefault();    
    $.ajax({
      url: `/submissions/${this.props.submission_id}/submission_replies`,
      type: 'POST',
      dataType: 'JSON',
      data: { submission_reply: { content: this.state.content } },
      context: this,
      success(data) {
        this.setState(this.getInitialState());
        this.props.handleNewReply(data);
        this.highlightSyntax();
        this.setState({btnDisabled: false});        
      }
    })
  },

  render() {
    return (
      <div className="row">
        <div className="col-xs-12 col-md-6"> 
          <form className="forum-forms">
            <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />
            <textarea name="content" 
                      value={this.state.content} 
                      ref="content" 
                      className="form-control" 
                      onChange={this.handleChange} 
                      rows="10"
                      placeholder="Write your reply in Markdown" />
            <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content || this.btnDisabled}>Submit</button>
          </form>
        </div>

        <div className="col-xs-12 col-md-6"> 
          <div id="preview">
            <h5>Preview</h5>            
            <div dangerouslySetInnerHTML={{__html: this.state.preview}} />            
          </div>
        </div>
      </div>
    )
  }
});