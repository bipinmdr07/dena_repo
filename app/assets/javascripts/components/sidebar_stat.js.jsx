let SidebarStat = React.createClass({
  render(){
    return (
      <div>        
        <p>{this.props.stat.quiz_category_name}</p>
        <p>{this.props.stat.score}</p>        
      </div>
    )
  }
})