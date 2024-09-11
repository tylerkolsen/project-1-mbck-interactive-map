import { useNavigate } from "react-router-dom"
import { useSelector } from "react-redux"
import { useEffect } from "react"

const UserNotes = () => {
    const userId = useSelector((state) => state.userId)
    
    const navigate = useNavigate()

    useEffect(() => {
        if (!userId) {
            navigate('/')
        }
    }, [userId])

    return(

        
        <p>USERNOTES!</p>
    )
}

export default UserNotes