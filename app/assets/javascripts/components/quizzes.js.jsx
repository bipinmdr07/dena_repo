let Quizzes = React.createClass({
  getInitialState() {
    return (
      quizProblems: [],
      current_position: 0
    );
  },

  componentDidMount() {
    $.getJSON('/admin/quiz_problems', (result) => {
      this.setState({quizProblems: result});
    });
  },

  render(){
    let options = this.state.quizProblems[this.state.current_position].quiz_options.map((option) => {
      return <option key={option.id} value={option.id}>{option.content}</option>
    })
    return (
      <form>
        <h3>{this.state.quizProblems[this.state.current_position].question}</h3>

        <select>
          {options}
        </select>
      </form>
    )
  }
})