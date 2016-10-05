let Questions = React.createClass({
  getInitialState() {
      return {
          replies: this.props.replies  
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
               display_post_links={reply["display_post_links"]}
               handleDeleteReply={this.handleDeleteReply} 
               />
      )
    });

    return (
      <div>
        <Question question={this.props.question}
                  content={this.props.content}
                  user_avatar_url={this.props.user_avatar_url} 
                  user_is_mentor={this.props.question.user_mentor}
                  user_name={this.props.user_name}
                  display_post_links={this.props.display_post_links}/>

        <hr />


        {replies}


        <QuestionForm question_id={this.props.question.id}
                      authenticity_token={this.props.authenticity_token}
                      handleNewReply={this.handleNewReply} />
      </div>
    )
  },

  handleNewReply(reply){
    let replies = React.addons.update(this.state.replies, {$push: [reply]});
    this.setState({replies: replies});
  },

  handleDeleteReply(deletedReply) {
    let replies = this.state.replies.filter(function(reply) {      
      return reply["reply"].id !== deletedReply.id;
    });
    this.setState({replies: replies});
  }

})