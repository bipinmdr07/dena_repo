let AdminQuizForm = React.createClass({
  getInitialState() {
      return {
          question: '',
          preview: '',
          quizOptionIds: [1,2,3,4],
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
        $("#previewQuiz").find("code").each(function(_, block) {
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

    let options = []
    _.each(this.state.quizOptionIds, (id) => {
      options.push({ content: this.refs["optionForm_" + id].state.content, correct: this.refs["optionForm_" + id].state.correct });
    });

    $.ajax({
      url: `/admin/quiz_problems`,
      type: 'POST',
      dataType: 'JSON',
      data: { 
              quiz_problem: { 
                question: this.state.question, 
                lesson_id: this.props.lesson_id,
                course_name: this.props.course_name,
                options: JSON.stringify(options)
              } 
            },
      context: this,
      success(data) {
        // build new set of quizOptionIds to re-render
        let idArray = [] 
        for(var i = 1; i <= 4; i++){
          idArray.push((this.state.quizOptionIds.slice(-1)[0]) + i);
        }

        this.setState({question: '', preview: '', btnDisabled: false, quizOptionIds: idArray})
        ok_sound.play();
      }
    })
  },

  handleAddOption(e){
    e.preventDefault();
    let quizOptionIds = React.addons.update(this.state.quizOptionIds, {$push: [(this.state.quizOptionIds.slice(-1)[0]) + 1]});
    this.setState({quizOptionIds: quizOptionIds});
  },

  handleDeleteOption(deletedOptionId){    
    let quizOptionIds = this.state.quizOptionIds.filter(function(id) {      
      return id !== deletedOptionId;
    });
    this.setState({quizOptionIds: quizOptionIds});
  },

  sidebarFormStyles(){
    return { width: this.props.sidebarFormWidth }
  },

  render() {
    let options = this.state.quizOptionIds.map((id) => {
      return <QuizOptionForm key={id}
                             id={id} 
                             ref={"optionForm_" + id}
                             handleAddOption={this.handleAddOption}
                             handleDeleteOption={this.handleDeleteOption}/>
    });

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

        <div className="row">
          <div className="col-xs-12 col-md-6">
            <textarea name="content" 
                      value={this.state.question} 
                      ref="question" 
                      className="form-control" 
                      onChange={this.handleQuestionChange} 
                      rows="10"
                      placeholder="Write your question in Markdown" />
          </div>

          <div className="col-xs-12 col-md-6">
            <div id="previewQuiz" className="preview">
              <h5>Preview</h5>
              <div dangerouslySetInnerHTML={{__html: this.state.preview}} />            
            </div>
          </div>
        </div>
        <br />

        {options}

        <div className="quiz-buttons">
          <button className="btn btn-cta-secondary btn-sm btn-add-option" onClick={this.handleAddOption}>
            <i className="fa fa-plus-circle" aria-hidden="true"></i> Add Option
          </button>

          <button className="btn btn-cta-primary submit-btn" onClick={this.handleSubmit} disabled={!this.state.question || this.btnDisabled}>Submit</button>
        </div>
      </form>        
    )
  }
});