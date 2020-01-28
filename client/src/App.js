import React from 'react';
import './App.css';
import Home from './components/Home';
import Secret from './components/Secret';
import Login from './components/Login';

function App() {
  return (
    <div className="App">
      <Home />
      <Secret />
      <Login />
    </div>
  );
}

export default App;
