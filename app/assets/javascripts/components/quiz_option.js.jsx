let QuizOption = React.createClass({
  getInitialState() {
    return {
      checked: false
    };
  },

  componentDidMount: function() {
    this.highlightSyntax();
  },

  checked(){      
    return _.contains(this.props.checkedOptionIds, String(this.props.option.id)) || this.state.checked;
  },

  handleChange(e){
    if (!this.props.submitted) {
      var id = e.target.value;
      this.setState({checked: !this.state.checked});
      this.props.handleChange(id);
    }
  },

  highlightSyntax(){
    $('pre code').each(function(i, block) {
      hljs.highlightBlock(block);
    });
  },

  render(){
    return (
      <div key={this.props.option.id} className="checkbox quiz-options">
        <label>
              <input type="checkbox" 
                     name={this.props.quizProblem} 
                     value={this.props.option.id} 
                     ref={"option_" + this.props.option.id}
                     onClick={this.handleChange}    
                     checked={this.checked()}                     
                     />
              <div dangerouslySetInnerHTML={{__html: this.props.option.content}} key={this.props.currentPosition}/>
        </label>
      </div>
    )
  }
})