let Replies = React.createClass({
  getInitialState() {
      return {
        replies: this.props.replies,
        current_user: this.props.current_user
      };
  },

  render(){
    let replies = this.state.replies.map((reply) => {
      return (
        <Reply key={reply[0].id}
               reply={reply[0]}
               user={reply[1]}
               display_post_links={ this.state.current_user == reply.user || this.state.current_user.admin }
               />
      )
    });
    return (
      <div>
        {replies}
      </div>
    )
  }
});