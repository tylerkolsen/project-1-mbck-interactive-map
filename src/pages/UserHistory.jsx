
import { useSelector } from "react-redux"
import { useState } from "react"
import CollectModal from "../components/CollectModal.jsx"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect"
import DeleteHistoryButton from "../components/DeleteHistoryButton.jsx"


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
            >{his.collectible.title}</li>
        )
    })

    return(
        <div className="h-full flex justify-center overflow-x-auto bg-no-repeat">
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <div>
                <h1>User History</h1>
                <ul>
                    {allHistory}
                </ul>
                <DeleteHistoryButton />
            </div>
        </div>
    )
}

export default UserHistory