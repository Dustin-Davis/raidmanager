import { useState, useEffect } from 'react'
import jwt_decode from "jwt-decode"
import './App.css'

function App() {
  const [ user, setUser ] = useState({})

  function handelCallbackResponse(response) {
    console.log('Encoded JWT ID Token: ' + response.credential);
    var userObject = jwt_decode(response.credential)
    console.log(userObject);
    setUser(userObject);
    document.getElementById("signInDiv").hidden = true;
  }

  function handleSignOut(event) {
    setUser({});
    document.getElementById("signInDiv").hidden = false;
  }

  useEffect(() => {
    // this is here so the linter doesn't see google as  not defined
    /* global google */
    google.accounts.id.initialize({
      client_id: "32320074669-e10phu5emi8q962i98siie3d1pl9jcoa.apps.googleusercontent.com",
      callback: handelCallbackResponse
    });

    google.accounts.id.renderButton(
      document.getElementById('signInDiv'),
      { theme:"outline", size: "large" }
    )
  }, []); // nothing in the array means the useEffect will only run once
  return (
    <>
  <div id='signInDiv'></div>
  { Object.keys(user).length != 0 &&
      <button onClick={(e) => handleSignOut(e)}>Sign Out</button>
  }

  { user &&
    <div>
      <img src= {user.picture}></img>
      <h3>{user.name}</h3>
    </div>
  }
    </>
  )
}

export default App
