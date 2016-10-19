let QuizOption = React.createClass({
  getInitialState() {
    return {
      checked: false
    };
  },

  optionStyles(option){
    if (this.props.showAnswers) {
      if (option.correct && this.state.checked) {
        return { boxShadow: "inset 0 0 0 3px #5cb85c", }
      } else {
        return { boxShadow: "inset 0 0 0 3px #ec6952", }
      }
    } 
  },

  handleChange(){
    if (this.props.submitted) {
      return;
    } else {
      this.setState({checked: !this.state.checked});
      this.props.handleChange();
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