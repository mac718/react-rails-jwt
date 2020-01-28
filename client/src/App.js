import React from 'react';
import './App.css';
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Link
} from 'react-router-dom';
import Home from './components/Home';
import Secret from './components/Secret';
import Login from './components/Login';

function App() {
  return (
    <Router>
      <div className="App">
        <ul>
          <li><Link to='/'>Home</Link></li>
          <li><Link to='/secret'>Secret</Link></li>
        </ul>
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/secret' component={Secret} />
          <Route path='/login' component={Login} />
        </Switch>
      </div>
    </Router>
  );
}

export default App;
