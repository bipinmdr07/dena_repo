let SidebarFlashcardForm = React.createClass({
  getInitialState() {
      return {
          question: '',
          answer: '',
          tags: ''
      };
  },

  handleChange(e) {
    let name = e.target.name;
    this.setState({[name]: e.target.value});
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

        <textarea name="question" 
                  className="form-control"
                  placeholder="Flashcard Question (Write in Markdown)" 
                  rows="5"
                  onChange={this.handleChange} />
        <br />                  

        <textarea name="answer" 
                  className="form-control"
                  placeholder="Answer (Write in Markdown)" 
                  rows="5"
                  onChange={this.handleChange} />
        <br />

        <input type="text"
               className="form-control"
               placeholder='Tags (separate tags with single comma ",")'
               onChange={this.handleChange} />
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

        <button className="btn btn-cta-primary submit-btn" 
                onClick={this.handleSubmit} 
                disabled={!this.state.question || !this.state.answer}>Submit</button>
      </form>
    )
  }
})