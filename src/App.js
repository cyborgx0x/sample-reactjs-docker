// src/App.js
import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Hello from Dockerized React App!</h1>
        <p>
          This is a simple React application running inside a Docker container.
        </p>
        <p>
          Environment: {process.env.REACT_APP_ENVIRONMENT || 'Development'}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;