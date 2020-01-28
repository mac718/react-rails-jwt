import React, {Component} from 'react'

class Home extends Component {

  constructor() {
    super();
    this.state = {
      message: 'loading...'
    }
  }

  componentDidMount() {
    fetch('/home')
      .then(res => res.json())
      .then(json => this.setState({ message: json.message }))
  }

  render() {
    return(
      <div>
        <h1>Home</h1>
        <p>{this.state.message}</p>
      </div>
    )
  }

}

export default Home;