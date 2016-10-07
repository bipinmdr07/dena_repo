let QuestionForm = React.createClass({
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
    e.preventDefault();
    this.setState({btnDisabled: true});
    $.ajax({
      url: `/questions/`,
      type: 'POST',
      dataType: 'JSON',
      data: { question: { content: this.state.content, title: this.state.title } },
      context: this,
      success(data) {
        this.setState(this.getInitialState());
        this.props.handleNewQuestion(data);
        this.setState({btnDisabled: false});
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

            <input type="text" 
                   className="form-control" 
                   name="title"                                       
                   placeholder="Title of Your Question"
                   onChange={this.handleTitleChange}/>

            <textarea name="content" 
                      value={this.state.content} 
                      ref="content" 
                      className="form-control" 
                      onChange={this.handleContentChange} 
                      rows="10"
                      placeholder="Write your reply in Markdown" />
            <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content || this.btnDisabled}>Submit</button>
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