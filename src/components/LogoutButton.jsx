import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"
import axios from "axios"

const LogoutButton = () => {

    const dispatch = useDispatch()
    const navigate = useNavigate()
    
    const handleLogout = () => {

        axios.post('/api/logout')
        .then((res) => {
            if (res.data.success) {
                dispatch({
                    type: "LOGOUT"
                })
                navigate('/')
            }
        })

    }

    return(
        <button
            onClick={handleLogout}
            className="border-black border-[2px]"
        >
            Log out
        </button>
    )
}

export default LogoutButton