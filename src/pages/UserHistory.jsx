
import { useSelector } from "react-redux"
import { useState } from "react"
import CollectModal from "../components/CollectModal.jsx"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect"


const UserHistory = () => {
    const userHistory = useSelector((state) => state.userHistory)
    const [displayModal, setDisplayModal] = useState(false)

    const dispatch = useDispatch()
    
    const allHistory = userHistory.map((his) => {
        return( 
            <li 
                key={his.usersCollectClickId} 
                id={his.usersCollectClickId}
                onClick={() => handleCollect(his.collectibleId, setDisplayModal, dispatch)}
                className="cursor-pointer text-blue-700 underline"
            >Collectible {his.collectibleId}</li>
        )
    })

    return(
        <>
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <div>
                <h1>User History</h1>
                <ul>
                    {allHistory}
                </ul>
            </div>
        </>
    )
}

export default UserHistory