
import { useSelector } from "react-redux"


const UserNotes = () => {
    const userId = useSelector((state) => state.userId)
    


    return(

        
        <p>USERNOTES!</p>
    )
}

export default UserNotes