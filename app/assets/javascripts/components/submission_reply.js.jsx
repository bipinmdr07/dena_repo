let SubmissionReply = React.createClass({
  getInitialState() {
      return {
        content: this.props.content,
        unparsedContent: this.props.reply.content,
        edit: false
      };
  },

  prof_badge(){
    let prof_badge;
    if (this.props.user_is_mentor === true) {
      prof_badge = 
        <div className="prof_badge">
          <label className="label label-default">TECHRISE Mentor</label>
        </div>
    }
    return prof_badge;
  },

  edit_post_links(){
    let edit_button = this.props.display_post_links ? <button className="btn btn-sm btn-warning" onClick={this.handleToggle}>Edit</button> : '';
    let delete_button = this.props.display_post_links ? <button className="btn btn-sm btn-danger" onClick={this.handleDelete}>Delete</button> : '';
    return (
      <div className="edit_post_links">
        <div className="btn-group">
          {edit_button}
          {delete_button}
        </div>
      </div>
    )
  },

  handleToggle(e) {
    e.preventDefault();
    this.setState({edit: !this.state.edit});  
    let that = this;
    setTimeout(function (){
      that.highlightSyntax();
    }, 1);
  },

  handleEdit(e){
    e.preventDefault();
    $.ajax({
      url: `/submissions/${this.props.reply.submission_id}/submission_replies/${this.props.reply.id}`,
      dataType: 'JSON',
      type: 'PUT',
      context: this,
      data: {
        submission_reply: { content: this.refs.content.value }
      },
      success: function(data) {
        this.setState({edit: false, content: data, unparsedContent: this.refs.content.value});   
        this.highlightSyntax();   
      }
    })
  },

  handleDelete(e) {
    e.preventDefault();
    if (confirm("Are you sure?")){
      $.ajax({
        url: `/submission_replies/${this.props.reply.id}`,
        type: 'DELETE',
        dataType: 'JSON',
        context: this,
        success(e) {
          this.props.handleDeleteReply(this.props.reply);
        }
      });
    }
  },

  highlightSyntax(){
    $('pre code').each(function(i, block) {
      hljs.highlightBlock(block);
    });   
  },

  content(){
    return (
      <div dangerouslySetInnerHTML={{__html: this.state.content}} />
    )    
  },

  editForm(){
    return (
      <form className="forum-forms">
        <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />
        <textarea name="content" defaultValue={this.state.unparsedContent} ref="content" className="form-control" rows="10" />

        <br />

        <div className="btn-group">
          <button className="btn btn-cta-primary" onClick={this.handleEdit}>Submit</button>
          <button className="btn btn-cta-secondary" onClick={this.handleToggle}>Cancel</button>
        </div>
      </form>
    )
  },

  replyBody(){
    if (this.state.edit) {
      return this.editForm();
    } else {
      return this.content();
    }
  },

  render() {
    return(
      <div>
        <div className="row">
          <div className="col-xs-12 col-sm-2">
            <img src={this.props.user_avatar_url} className="prof_pic_forum"/>
            <div className="prof_name">
              {this.props.user_name}
            </div>            
            {this.prof_badge()}
            {this.edit_post_links()}
          </div>

          <div className="col-xs-12 col-sm-10">
            {this.replyBody()}
          </div>        
        </div>
        <hr />
      </div>
    )
  }
})