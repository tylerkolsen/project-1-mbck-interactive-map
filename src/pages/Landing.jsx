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

    const handleCreateAccount = () => {
        setMessage('')
        setDisplayCreate(true)
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
        <div className="h-screen w-full flex flex-col justify-center items-center bg-gradient-to-br from-mYDark to-mYLight">
            <h1
                className="text-mBrDark text-3xl mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark"
            >Welcome to MBCK Interactive</h1>
            <form 
                onSubmit={handleLogin}
                className="flex flex-col"
            >
                <input 
                    type="text" 
                    value={email}
                    placeholder="Username"
                    required
                    onChange={(e) => setEmail(e.target.value)}
                    className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1 mt-2 mb-1 focus:ring-0 focus:outline-none"
                />
                <input 
                    type="password" 
                    value={password}
                    placeholder="Password"
                    required
                    onChange={(e) => setPassword(e.target.value)}
                    className="bg-gray-400/40 border-mBrDark  text-mBrDark border-[1px] rounded-lg pt-1 ps-1 mb-4 focus:ring-0 focus:outline-none"
                />
                <input 
                    type="submit" 
                    className="otherButton rounded-full pb-1 pt-2"
                />
            </form>
            <button
                className="otherButton rounded-full pb-1 pt-2 px-[42px] my-1"
                onClick={handleCreateAccount}
            >Create Account</button>
            <h2
                className="text-mBrDark text-3xl mb-[6px] pb-[3px] pt-3"
            >{message}</h2>
        </div>
    )
}

export default Landing