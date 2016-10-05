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
        <Reply key={reply["reply"].id}
               reply={reply["reply"]}
               content={reply["content"]}
               user_avatar_url={reply["user_avatar_url"]}
               user_is_mentor={reply["user_is_mentor"]}
               user_name={reply["user_name"]}               
               display_post_links={reply["display_post_links"] }
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