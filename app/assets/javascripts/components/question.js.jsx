let Question = React.createClass({
  getInitialState() {
      return {
        content: this.props.content,
        unparsedContent: this.props.question.content,
        edit: false
      };
  },

  prof_badge(){
    if (this.props.user_is_mentor) {
      return (
        <div className="prof_badge">
          <label className="label label-default">TECHRISE Mentor</label>
        </div>
      )
    }
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
      url: `/questions/${this.props.question.id}`,
      dataType: 'JSON',
      type: 'PATCH',
      context: this,
      data: {
        question: { content: this.refs.content.value }
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
        url: `/questions/${this.props.question.id}`,
        type: 'DELETE',
        dataType: 'JSON',
        context: this,
        success(data) {
          if (data.redirect) {
            window.location = data.redirect;
          }
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

  questionBody(){
    if (this.state.edit) {
      return this.editForm();
    } else {
      return this.content();
    }
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

  render() {


    return(
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
          {this.questionBody()}
        </div>
      </div>
    )
  }
})