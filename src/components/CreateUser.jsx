import { useState } from "react"
import { useDispatch } from "react-redux"
import axios from "axios"
import { useNavigate } from "react-router-dom"


function CreateUser({ setDisplayCreate }) {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [message, setMessage] = useState('')

    const dispatch = useDispatch()
    const navigate = useNavigate()

    const handleCreateUser = (e) => {
        e.preventDefault()
        axios.post('/api/createUser', {
            email: email,
            password: password
        })
        .then((res) => {
            if (res.data.success) {
                dispatch({
                    type: "USER_AUTH",
                    payload: res.data.userId
                })
                setDisplayCreate(false)
                setEmail('')
                setPassword('')
                navigate('/Home')
            }
            setMessage(res.data.message)
        })
    }

  return (
    <div className="h-screen w-full flex flex-col justify-center items-center bg-gradient-to-br from-mYDark to-mYLight">
            <h1
                className="text-mBrDark text-3xl mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark"
            >Create A New User</h1>
            <form 
                onSubmit={handleCreateUser}
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
                    className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1 mb-4 focus:ring-0 focus:outline-none"
                />
                <input 
                    type="submit" 
                    className="otherButton rounded-full pb-1 pt-2"
                />
            </form>
            <button
                className="otherButton rounded-full pb-1 pt-2 px-[48px] my-1"
                onClick={() => setDisplayCreate(false)}
            >Back to Login</button>
            <h2
                className="text-mBrDark text-3xl mb-[6px] pb-[3px] pt-3"
            >{message}</h2>
        </div>
  )
}

export default CreateUser