import { useState, useEffect } from "react"
import { useDispatch } from "react-redux"
import axios from "axios"
import { useNavigate } from "react-router-dom"
import CreateUser from "../components/CreateUser"

const Landing = () => {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [message, setMessage] = useState('')
    const [displayCreate, setDisplayCreate] = useState(false)

    const dispatch = useDispatch()
    const navigate = useNavigate()

    const handleLogin = (e) => {
        e.preventDefault()
        axios.post("/api/auth", {
            email: email,
            password: password
        })
        .then((res) => {
            if (res.data.success) {
                dispatch({
                    type: "USER_AUTH",
                    payload: res.data.userId
                })
                setEmail('')
                setPassword('')
                navigate('/Home')
            }
            setMessage(res.data.message)
        })
    }

    // This function runs our session cookie check. If there is a session cookie, the server will return that value to us and confirm it is there
    const sessionCheck = () => {
        axios.get('/api/session-check')
        .then((res) => {
            if (res.data.success) {
                dispatch({
                    type: "USER_AUTH",
                    payload: res.data.userId
                })
                navigate("/Home")
            }
        })
    }

    // This runs sessionCheck on initial render, which will see if the user still has a userId in the session cookie.
    useEffect(() => {
        sessionCheck()
    }, [])

    return displayCreate ? (
        <div className="h-full flex-col justify-center">
            <CreateUser setDisplayCreate={setDisplayCreate}/>
        </div>
    ) : (
        <div className="h-full flex-col justify-center">
            <h1>Login</h1>
            <form 
                onSubmit={handleLogin}
                className="flex"
            >
                <input 
                    type="text" 
                    value={email}
                    placeholder="Email"
                    onChange={(e) => setEmail(e.target.value)}
                    className="bg-gray-400/40 border-black border-[1px]"
                />
                <input 
                    type="password" 
                    value={password}
                    placeholder="Password"
                    onChange={(e) => setPassword(e.target.value)}
                    className="bg-gray-400/40 border-black border-[1px]"
                />
                <input 
                    type="submit" 
                    className="border-black border-[2px]"
                />
            </form>
            <h2>{message}</h2>
            <button
                className="border-black border-[2px]"
                onClick={() => setDisplayCreate(true)}
            >Create Account</button>
        </div>
    )
}

export default Landing