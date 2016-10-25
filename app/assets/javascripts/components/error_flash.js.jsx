let ErrorFlash = React.createClass({
  render(){
    return (
      <div className="alert alert-danger alert-dismissible text-center">
        <button type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        {this.props.errorMessage}
      </div>
    )
  }
})