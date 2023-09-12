import { useState, useEffect } from 'react'
import './App.css'

function App() {

  function handelCallbackResponse(response) {
    console.log('Encoded JWT ID Token: ' + response.credential);
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
    </>
  )
}

export default App
