import { gapi } from "gapi-script";
import { useState, useEffect } from "react";
import axios from "axios";

// This uses the GAPI library in order to get a proper OAuth2 access token.
function GoogleCalendar() {
  const [userCalendar, setUserCalendar] = useState([])

  useEffect(() => {
    const start = () => {
      gapi.client.init({
        clientId: "870307048836-vfoobt28v52ucfu0ohuo1sgp27jnh194.apps.googleusercontent.com",
        scope: "https://www.googleapis.com/auth/calendar",
      })
    }

    gapi.load('client:auth2', start)
  }, [])

  const handleLogin = () => {
    const GoogleAuth = gapi.auth2.getAuthInstance()

    GoogleAuth.signIn()
      .then((googleUser) => {
        const accessToken = googleUser.getAuthResponse().access_token
        console.log('Access Token:', accessToken)

        // send the access token to the backend
        axios.post('/api/googleCalendar', {
          accessToken
        })
          .then((res)=> {
            setUserCalendar(res.data.calendarData.items)
          })
      })
  }

    const allEvents = userCalendar.map((event, idx) => {
      const dateSwap = new Date(event.start.dateTime)

      return (
        <li key={`event ${idx}`}>
          <a href={event.htmlLink} target="_blank" rel="noreferrer noopener">{event.summary}</a>
          <p>{dateSwap.toDateString()} {dateSwap.toLocaleTimeString('en-US', {hour: 'numeric', hour12: true, minute: 'numeric'})}</p>
        </li>
      )
    })

  return (
    <>
       <div>
        <h2>Sign in with Google</h2>
        <button
          onClick={handleLogin}
          className="border-[1px] border-black"
        >Sign in with Google</button>
       </div>
       <div>
          <h2>Upcoming Events</h2>
          <ul>{allEvents}</ul>
       </div>
    </>
    
  )
}

export default GoogleCalendar