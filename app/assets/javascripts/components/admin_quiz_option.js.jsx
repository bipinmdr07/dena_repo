let AdminQuizOption = React.createClass({
  getInitialState() {
    return {
      edit: false,
      content: this.props.quizOption.content,
      correct: this.props.quizOption.correct
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
        quiz_option: { content: this.refs.content.value, correct: this.state.correct }
      },
      success: function(data) {
        console.log(data);
        this.setState({edit: false, content: data.content});   
      }
    })
  },

  handleToggleCorrect(e) {
    this.setState({correct: !this.state.correct});
  },

  quizOption(){
    if (this.state.edit) {
      return (
        <form style={{"paddingBottom": "20px", "marginTop": "20px", "borderBottom": "2px solid #eee"}}>
          <input type="text" defaultValue={this.state.content} ref="content" className="form-control" />

          <div className="radio" onChange={this.handleToggleCorrect}>
            <label className="radio-inline"><input type="radio" value="true" checked={this.state.correct == true}/>Correct</label>
            <label className="radio-inline"><input type="radio" value="false" checked={this.state.correct == false}/>Incorrect</label>
          </div>

          <div className="btn-group">
            <button className="btn btn-sm btn-cta-primary" onClick={this.handleEdit}>Submit</button>
            <button className="btn btn-sm btn-cta-secondary" onClick={this.handleToggle}>Cancel</button>
          </div>
        </form>
      )
    } else {
      return (
        <li onClick={this.handleToggle} style={{"position": "relative"}}>          
          <div dangerouslySetInnerHTML={{__html: this.state.content}} />
          <label className="label label-default" style={{"position": "absolute", "right": "10px", "bottom": "10px"}}>{this.state.correct ? "True" : "False"}</label> 
        </li>
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