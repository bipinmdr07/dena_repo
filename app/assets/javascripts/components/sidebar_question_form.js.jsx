let SidebarQuestionForm = React.createClass({
  getInitialState() {
      return {
          content: '',
          title: '',
          preview: '',
          btnDisabled: false  
      };
  },

  highlightSyntax(){
    $('pre code').each(function(i, block) {
      hljs.highlightBlock(block);
    });   
  },

  handleTitleChange(e){
    this.setState({title: e.target.value});
  }, 

  handleContentChange(e){
    this.setState({content: e.target.value});
  },  

  handleSubmit(e){
    this.setState({btnDisabled: true});
    e.preventDefault();
    $.ajax({
      url: `/questions/`,
      type: 'POST',
      dataType: 'JSON',
      data: 
            { 
              question: { 
                content: this.state.content, 
                title: this.state.title, 
                lesson_id: this.props.lesson_id,
                course_name: this.props.course_name
              } 
            },
      context: this,
      success(data) {
        this.setState(this.getInitialState());
        this.setState({btnDisabled: false});
        ok_sound.play();
        this.props.handleSubmit();
      }
    })
  },

  render() {
    return (
      <form id="sidebar-question-form" className="sidebar-form">
        <h3>Ask Question</h3>

        <input type='hidden'                    
               name='authenticity_token' 
               value={this.props.authenticity_token} />
        <input type='hidden'                    
               name='lesson_id'                    
               value={this.props.lesson_id} />
        <input type='hidden'                    
               name='course_name'                    
               value={this.props.course_name} />

        <input type="text" 
               value={this.state.title}
               className="form-control" 
               name="title"                                       
               placeholder="Title of Your Question"
               onChange={this.handleTitleChange}/>
        <br />

        <textarea name="content" 
                  value={this.state.content} 
                  ref="content" 
                  className="form-control" 
                  onChange={this.handleContentChange} 
                  rows="10"
                  placeholder="Write your question in Markdown" />
        <br />

        <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content || !this.state.title || this.btnDisabled}>Submit</button>
      </form>        
    )
  }
});