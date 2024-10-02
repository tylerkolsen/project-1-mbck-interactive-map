import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"
import axios from "axios"

const LogoutButton = () => {

    const dispatch = useDispatch()
    const navigate = useNavigate()
    
    const handleLogout = ({ setDisplayMobileMenu }) => {

        axios.post('/api/logout')
        .then((res) => {
            if (res.data.success) {
                dispatch({
                    type: "LOGOUT"
                })
                navigate('/')
                if ( setDisplayMobileMenu !== undefined) {
                    setDisplayMobileMenu(false)
                }
            }
        })
    }

    return(
        <button
            onClick={handleLogout}
        >Log Out</button>
    )
}

export default LogoutButton