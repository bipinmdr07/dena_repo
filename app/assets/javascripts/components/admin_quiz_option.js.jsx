let AdminQuizOption = React.createClass({
  getInitialState() {
    return {
      edit: false,
      content: this.props.quizOption.content
    };
  },

  handleToggle(e){
    e.preventDefault();
    this.setState({edit: !this.state.edit});
  },

  handleEdit(e){
    e.preventDefault();
    $.ajax({
      url: `/admin/quiz_options/${this.props.quizOption.id}`,
      dataType: 'JSON',
      type: 'PATCH',
      context: this,
      data: {
        quiz_option: { content: this.refs.content.value }
      },
      success: function(data) {
        console.log(data);
        this.setState({edit: false, content: data});   
      }
    })
  },

  quizOption(){
    if (this.state.edit) {
      return (
        <form>
          <input type="text" defaultValue={this.state.content} ref="content" className="form-control" />

          <div className="btn-group">
            <button className="btn btn-cta-primary" onClick={this.handleEdit}>Submit</button>
            <button className="btn btn-cta-secondary" onClick={this.handleToggle}>Cancel</button>
          </div>
        </form>
      )
    } else {
      return (
        <p onClick={this.handleToggle}>{this.state.content}</p>
      )
    }
  },

  render(){
    return (
      <div>        
        {this.quizOption()}
      </div>
    )
  }
})