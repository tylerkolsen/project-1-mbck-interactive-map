
import { useSelector } from "react-redux"


const UserHistory = () => {
    const userId = useSelector((state) => state.userId)
    


    return(
        <p>UserHistory.jsx</p>
    )
}

export default UserHistory