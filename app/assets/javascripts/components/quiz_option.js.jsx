let QuizOption = React.createClass({
  getInitialState() {
    return {
      checked: false
    };
  },

  optionStyles(option){
    if (this.props.showAnswers) {
      if (option.correct || (this.state.checked && this.state.correct) ) {
        return { boxShadow: "inset 0 0 0 3px #5cb85c", }
      } else {
        return { boxShadow: "inset 0 0 0 3px #ec6952", }
      }
    } 
  },

  handleChange(e){
    if (this.props.submitted) {
      return;
    } else {
      var id = e.target.value;

      this.setState({checked: !this.state.checked});
      
      this.props.handleChange(id);
    }
  },

  render(){
    return (
      <div key={this.props.option.id} className="checkbox quiz-options" style={this.optionStyles(this.props.option)}>
        <label>
              <input type="checkbox" 
                     name={this.props.quizProblem} 
                     value={this.props.option.id} 
                     ref={"option_" + this.props.option.id}
                     onChange={this.handleChange}    
                     checked={this.state.checked}                     
                     />
              {this.props.option.content}
        </label>
      </div>
    )
  }
})