let SubmissionForm = React.createClass({
  getInitialState() {
      return {
          content: '',
          title: '',
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

  handleTitleChange(e){
    this.setState({title: e.target.value});
  }, 

  handleContentChange(e){
    this.setState({content: e.target.value});
    this.loadPreview();
  },  

  handleSubmit(e){
    this.setState({btnDisabled: true});
    e.preventDefault();
    $.ajax({
      url: `/submissions/`,
      type: 'POST',
      dataType: 'JSON',
      data: 
            { 
              submission: { 
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
        if (data.redirect) {
          window.location = data.redirect;
        }
      }
    })
  },

  render() {
    return (
      <div className="row">
        <div className="col-xs-12 col-md-6"> 
          <form className="forum-forms">
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
                   placeholder="Title of Your Submission"
                   onChange={this.handleTitleChange}/>

            <textarea name="content" 
                      value={this.state.content} 
                      ref="content" 
                      className="form-control" 
                      onChange={this.handleContentChange} 
                      rows="10"
                      placeholder="Write your submission in Markdown" />
            <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content || !this.state.title || this.btnDisabled}>Submit</button>
          </form>
        </div>

        <div className="col-xs-12 col-md-6"> 
          <div id="preview">
            <h5>Preview</h5>
            <h3>{this.state.title}</h3>
            <div dangerouslySetInnerHTML={{__html: this.state.preview}} />            
          </div>
        </div>
      </div>
    )
  }
});