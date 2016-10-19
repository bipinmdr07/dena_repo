let SidebarStats = React.createClass({
  render(){
    let sortedStats = _.sortBy(this.props.stats, (stat) => { let scores = stat.score; return -scores; })
    let stats = sortedStats.map((stat) => {
      return <SidebarStat key={stat.id} stat={stat}/>
    });

    return (
      <form className="sidebar-form" style={this.props.sidebarFormStyles}>
        <h3>Your Stats</h3>

        <a href="#" onClick={this.props.goBack}><i className="fa fa-caret-left" aria-hidden="true"></i> Back</a>

        <div className="dropdown sort-menu pull-right">
          <button className="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            <i className="fa fa-bars" style={{"color": "#333"}} aria-hidden="true"></i>
          </button>
          <ul className="dropdown-menu" aria-labelledby="dropdownMenu1">
            <li onClick={this.props.sortStatsByHighest}>
              Highest Scores                  
            </li>
            <li onClick={this.props.sortStatsByLowest}>
              Lowest Scores                
            </li>
          </ul>
        </div>
        
        {stats}
      </form> 
    )
  }
})