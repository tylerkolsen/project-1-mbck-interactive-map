import { GoogleOAuthProvider, GoogleLogin } from '@react-oauth/google';
import { jwtDecode } from 'jwt-decode'
import axios from 'axios';

// @react-oauth/google is used to authenticate users, and it's purpose is to allow users to login to your site using google instead of needing a password. It does NOT give authorization to access portions of their profile, including the calendar. I'm saving this as an example, but I'm putting the calendar access into another file (GoogleCalendar.jsx)
const GoogleLoginButton = () => {
  const handleSuccess = (credentialResponse) => {
    const decodedToken = jwtDecode(credentialResponse.credential);
    console.log('User Info:', decodedToken);

    // You can now send this token to your backend for authentication
    const accessToken = credentialResponse.credential
    // console.log('The token:', accessToken)
    
    axios.post('/api/googleCalendar', {
      accessToken
    })
      .then((res) => {
        console.log(res.data)
      })

  };


  const handleError = () => {
    console.log('Login Failed');
  };

  return (
    <GoogleOAuthProvider clientId="870307048836-vfoobt28v52ucfu0ohuo1sgp27jnh194.apps.googleusercontent.com">
      <div>
        <h2>Sign in with Google</h2>
        <GoogleLogin
          onSuccess={handleSuccess}
          onError={handleError}
          scope="https://www.googleapis.com/auth/calendar" // Request Calendar access
        />
        <button>

        </button>
      </div>
    </GoogleOAuthProvider>
  );
};

export default GoogleLoginButton;