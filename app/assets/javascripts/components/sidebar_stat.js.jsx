let SidebarStat = React.createClass({
  getInitialState() {
    return{
      width: 0
    };
  },

  componentDidMount() {
    this.increaseWidth();
  },

  componentDidUpdate(prevProps, prevState) {    
    this.increaseWidth();
  },

  increaseWidth(){
    var that = this;
    var increaseWidth = setInterval(function () {
      if(that.state.width > that.props.stat.score) {
        clearInterval(increaseWidth)
      } else {
        that.setState({width: that.state.width + 1});
      }      
    }, 50);
  },

  barGraphStyle(){
    let backgroundColor;
    if (0 <= this.props.stat.score && this.props.stat.score <= 50) {
      backgroundColor = "#ff0000";
    } else if (50 < this.props.stat.score && this.props.stat.score <= 70) {
      backgroundColor = "#ec6952";
    } else if (70 < this.props.stat.score && this.props.stat.score <= 80) {
      backgroundColor = "#2e6da4";
    } else if(80 < this.props.stat.score && this.props.stat.score <= 90) {
      backgroundColor = "#337ab7";
    } else {
      backgroundColor = "#5cb85c";
    }
    return { backgroundColor: backgroundColor, width: this.state.width + "%", height: "20px", borderRadius: "2px" }
  },

  render(){
    return (
      <div style={{"marginTop": "10px", "marginBottom": "10px"}}>        
        <p style={{"fontWeight": "400", "color": "#777", "fontSize": "26px"}}>
          {this.props.stat.quiz_category_name} <span style={{"color": "white", "fontSize": "16px"}}>{this.props.stat.score.toFixed(2)}%</span>
        </p>
        <div style={this.barGraphStyle()}></div>
      </div>
    )
  }
})