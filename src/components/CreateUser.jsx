import axios from "axios"
import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"
import { useState } from "react"

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
                    placeholder="Email"
                    onChange={(e) => setEmail(e.target.value)}
                    className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1 mt-2 mb-1"
                />
                <input 
                    type="password" 
                    value={password}
                    placeholder="Password"
                    onChange={(e) => setPassword(e.target.value)}
                    className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1 mb-4"
                />
                <input 
                    type="submit" 
                    className="cursor-pointer text-mBrDark border-[2px] border-mBrDark bg-mGLight pb-1 pt-2 rounded-full"
                />
            </form>
            <button
                className="text-mBrDark border-[2px] border-mBrDark bg-mGLight pb-1 pt-2 px-[48px] rounded-full my-1"
                onClick={() => setDisplayCreate(false)}
            >Back to Login</button>
            <h2
                className="text-mBrDark text-3xl mb-[6px] pb-[3px] pt-3"
            >{message}</h2>
        </div>
  )
}

export default CreateUser