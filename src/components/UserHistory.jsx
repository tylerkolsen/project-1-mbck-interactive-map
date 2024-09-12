
import { useSelector } from "react-redux"


const UserHistory = () => {
    const userHistory = useSelector((state) => state.userHistory)
    
    const allHistory = userHistory.map((his) => {
        return <li key={his.usersCollectClickId} id={his.usersCollectClickId}>Collectible {his.collectibleId}</li>
    })

    return(
        <div>
            <h1>User History</h1>
            <ul>
                {allHistory}
            </ul>
        </div>
    )
}

export default UserHistory