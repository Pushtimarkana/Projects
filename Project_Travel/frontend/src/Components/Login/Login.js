// import React, { useState } from 'react';
// //import axios from 'axios';

// const LoginPage = () => {
//   const [email, setEmail] = useState('');
//   const [password, setPassword] = useState('');
//   const [error, setError] = useState(null);

//   const handleSubmit = async (event) => {
//     event.preventDefault();
//     try {
//       const response = await axios.post('/login', { email, password });
//       const token = response.data.token;
//       localStorage.setItem('token', token);
//       window.location.href = '/';
//     } catch (error) {
//       setError(error.response.data.error);
//     }
//   };

//   return (
//     <div className="login-page">
//       <h1>Login</h1>
//       <form onSubmit={handleSubmit}>
//         <label>Email:</label>
//         <input type="email" value={email} onChange={(event) => setEmail(event.target.value)} />
//         <br />
//         <label>Password:</label>
//         <input type="password" value={password} onChange={(event) => setPassword(event.target.value)} />
//         <br />
//         <button type="submit">Login</button>
//       </form>
//       {error && <div style={{ color: 'red' }}>{error}</div>}
//     </div>
//   );
// };

// export default LoginPage;

import React, { useState } from 'react';
//import axios from 'axios';
import './Login.css';

const LoginPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState(null);

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await axios.post('/login', { email, password });
      const token = response.data.token;
      localStorage.setItem('token', token);
      window.location.href = '/';
    } catch (error) {
      setError(error.response.data.error);
    }
  };

  return (
    <div className="login-container">
      <div className="login-form">
        <h1>Login</h1>
        <form onSubmit={handleSubmit}>
          <label>Email:</label>
          <input
            type="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            className="input-field"
          />
          <br />
          <label>Password:</label>
          <input
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            className="input-field"
          />
          <br />
          <button type="submit" className="login-btn">
            Login
          </button>
        </form>
        {error && <div className="error-msg">{error}</div>}
      </div>
    </div>
  );
};

export default LoginPage;