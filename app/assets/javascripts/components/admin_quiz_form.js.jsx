let AdminQuizForm = React.createClass({
  getInitialState() {
      return {
          question: '',
          preview: '',
          quizOptions: [<QuizOptionForm key={1} 
                                        id={1}
                                        handleAddOption={this.handleAddOption}
                                        handleDeleteOption={this.handleDeleteOption}/>,
                        <QuizOptionForm key={2} 
                                        id={2}
                                        handleAddOption={this.handleAddOption}
                                        handleDeleteOption={this.handleDeleteOption}/>,
                        <QuizOptionForm key={3} 
                                        id={3}
                                        handleAddOption={this.handleAddOption}
                                        handleDeleteOption={this.handleDeleteOption}/>,
                        <QuizOptionForm key={4} 
                                        id={4}
                                        handleAddOption={this.handleAddOption}
                                        handleDeleteOption={this.handleDeleteOption}/>
                                        ],
          btnDisabled: false  
      };
  },

  highlightSyntax(){
    $('pre code').each(function(i, block) {
      hljs.highlightBlock(block);
    });   
  },

  loadPreview: _.debounce(function(){
    $.ajax({
      url: '/markdown_previews',
      type: 'POST',
      dataType: 'JSON',
      data: { preview: { content: this.state.question }},
      context: this,
      success(data) {
        this.setState({preview: data});
        $("#preview").find("code").each(function(_, block) {
          hljs.highlightBlock(block);
        });
      } 
    });
  }, 300),

  handleQuestionChange(e){
    this.setState({question: e.target.value});
    this.loadPreview();
  }, 

  handleSubmit(e){
    this.setState({btnDisabled: true});
    e.preventDefault();
    $.ajax({
      url: `/quiz_questions/`,
      type: 'POST',
      dataType: 'JSON',
      data: 
            { 
              quiz_questions: { 
                question: this.state.question, 
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

  handleAddOption(e){
    e.preventDefault();

    let quizOptionForm = <QuizOptionForm key={this.state.quizOptions.length + 1}
                                         id={this.state.quizOptions.length + 1} 
                                         handleAddOption={this.handleAddOption}
                                         handleDeleteOption={this.handleDeleteOption}/>
    let quizOptions = React.addons.update(this.state.quizOptions, {$push: [quizOptionForm]});
    this.setState({quizOptions: quizOptions});
  },

  handleDeleteOption(deletedOptionId){    
    let quizOptions = this.state.quizOptions.filter(function(option) {      
      return option.props.id !== deletedOptionId;
    });
    this.setState({quizOptions: quizOptions});
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  render() {

    return (
      <form id="sidebar-question-form" className="sidebar-form" style={this.sidebarFormStyles()}>
        <h3>Add Quiz</h3>

        <input type='hidden'                    
               name='authenticity_token' 
               value={this.props.authenticity_token} />
        <input type='hidden'                    
               name='lesson_id'                    
               value={this.props.lesson_id} />
        <input type='hidden'                    
               name='course_name'                    
               value={this.props.course_name} />

        <textarea name="content" 
                  value={this.state.question} 
                  ref="question" 
                  className="form-control" 
                  onChange={this.handleQuestionChange} 
                  rows="10"
                  placeholder="Write your question in Markdown" />
        <br />

        <div id="preview">
          <h5>Preview</h5>
          <div dangerouslySetInnerHTML={{__html: this.state.preview}} />            
        </div>

        <br />

        {this.state.quizOptions}

        <div className="quiz-buttons">
          <button className="btn btn-cta-secondary btn-sm btn-add-option" onClick={this.handleAddOption}>
            <i className="fa fa-plus-circle" aria-hidden="true"></i> Add Option
          </button>

          <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.content || !this.state.title || this.btnDisabled}>Submit</button>
        </div>
      </form>        
    )
  }
});