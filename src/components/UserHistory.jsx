import { useNavigate } from "react-router-dom"
import { useSelector } from "react-redux"
import { useEffect } from "react"

const UserHistory = () => {
    const userId = useSelector((state) => state.userId)
    
    const navigate = useNavigate()

    useEffect(() => {
        if (!userId) {
            navigate('/')
        }
    }, [userId])

    return(
        <p>UserHistory.jsx</p>
    )
}

export default UserHistory