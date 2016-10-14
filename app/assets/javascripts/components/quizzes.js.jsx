let Quizzes = React.createClass({
  getInitialState(){
    return (
      quizProblems: []
    ),
  },

  componentDidMount() {
    $.getJSON('/admin/quiz_problems', (result) => {
      this.setState({quizCategories: result});
    });
  },

  render(){
    return (

    )
  }
})