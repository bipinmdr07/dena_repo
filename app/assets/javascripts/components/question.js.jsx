let Question = React.createClass({
  getInitialState() {
      return {
        editing: false
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

  edit_post_links(){
    let edit_button = this.props.display_post_links ? <button className="btn btn-sm btn-warning" onClick={this.handleEdit}>Edit</button> : '';
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
          <div dangerouslySetInnerHTML={{__html: this.props.content}} />
        </div>
      </div>
    )
  }
})