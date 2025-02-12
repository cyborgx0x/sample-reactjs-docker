// src/index.js (Combined - Was App.js and the old index.js)
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css'; // Now imports index.css
// No import of App is needed anymore!

function App() { // Or rename this function to something else, like 'Root'
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

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App /> {/* Use the App component directly */}
  </React.StrictMode>
);

// reportWebVitals is no longer strictly needed here, but you *can* include it
// if you are using it.  If you aren't using it, you can remove this line.
// import reportWebVitals from './reportWebVitals';
// reportWebVitals();