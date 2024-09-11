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
    <div className="flex-row place-content-center">
            <h1>Create User</h1>
            <form 
                onSubmit={handleCreateUser}
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
                onClick={() => setDisplayCreate(false)}
            >Back to Login</button>
        </div>
  )
}

export default CreateUser