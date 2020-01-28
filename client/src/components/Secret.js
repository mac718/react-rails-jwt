import React, {Component} from 'react';
import {Redirect} from 'react-router-dom';

class Secret extends Component {
  constructor(props) {
    super(props)
    this.state = {
      secret: ''
    }
  }

  componentDidMount() {
    fetch('/secret')
      .then(res => res.json())
      .then(json => this.setState({ secret: json.secret }))
  }

  render() {
    return(
      <div>
        <h1>{this.state.secret}</h1>
      </div>
    )
  }
}

export default Secret;