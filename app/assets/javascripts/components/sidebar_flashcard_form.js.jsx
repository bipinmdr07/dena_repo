let SidebarFlashcardForm = React.createClass({
  getInitialState() {
      return {
          question: '',
          answer: '',
          tags: '',
          previewquestion: '',
          previewanswer: ''
      };
  },

  loadPreview: _.debounce(function(args){
    $.ajax({
      url: '/markdown_previews',
      type: 'POST',
      dataType: 'JSON',
      data: { preview: { content: args.value }},
      context: this,
      success(data) {
        this.setState({["preview" + args.name]: data});
        $(".previewFlashcard").find("code").each(function(_, block) {
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

  handleChange(e) {
    let name = e.target.name;
    let value = e.target.value;
    this.setState({[name]: value});
    this.loadPreview({value: value, name: name});
  },

  handleSubmit(e){
    e.preventDefault();
    $.ajax({
      url: `/cards/`,
      type: 'POST',
      dataType: 'JSON',
      data: 
            { 
              card: { 
                question: this.state.question, 
                answer: this.state.answer, 
                tag_list: this.state.tags,
                lesson_url: this.props.lesson_url
              } 
            },
      context: this,
      success(data) {
        this.setState(this.getInitialState());
        ok_sound.play();
        this.props.handleSubmit();
      }
    })
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  render(){
    return(
      <form id="sidebar-flashcard-form" className="sidebar-form" style={this.sidebarFormStyles()}>
        <h3>Create New Flashcard</h3>
        <input type='hidden'                    
               name='authenticity_token' 
               value={this.props.authenticity_token} />

        <div className="row">
          <div className="col-xs-12 col-md-6">
            <textarea name="question" 
                      className="form-control"
                      placeholder="Flashcard Question (Write in Markdown)" 
                      rows="9"
                      onChange={this.handleChange} />
          </div>

          <div className="col-xs-12 col-md-6">
            <div className="preview previewFlashcard">
              <h5>Preview</h5>
              <div dangerouslySetInnerHTML={{__html: this.state.previewquestion}} />  
            </div>
          </div>
        </div>

        <br />                  

        <div className="row">
          <div className="col-xs-12 col-md-6">
            <textarea name="answer" 
                      className="form-control"
                      placeholder="Answer (Write in Markdown)" 
                      rows="9"
                      onChange={this.handleChange} />
          </div>

          <div className="col-xs-12 col-md-6">
            <div className="preview previewFlashcard">
              <h5>Preview</h5>
              <div dangerouslySetInnerHTML={{__html: this.state.previewanswer}} />  
            </div>
          </div>
        </div>
        <br />

        <div className="row">
          <div className="col-xs-12">
            <input type="text"
                   className="form-control"
                   placeholder='Tags (separate tags with single comma ",")'
                   onChange={this.handleChange} />
          </div>
        </div>
        <br />

        <input type='hidden'                    
               name='lesson_url'                    
               value={this.props.lesson_url} />
        <input type='hidden'                    
               name='lesson_id'                    
               value={this.props.lesson_id} />
        <input type='hidden'                    
               name='course_name'                    
               value={this.props.course_name} />

        <div className="row">
          <div className="col-xs-12">
            <button className="btn btn-cta-primary submit-btn" 
                    onClick={this.handleSubmit} 
                    disabled={!this.state.question || !this.state.answer}>Submit</button>
          </div>
        </div>
      </form>
    )
  }
})