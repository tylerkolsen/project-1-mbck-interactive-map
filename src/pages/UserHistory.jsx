import { useState, useEffect } from "react"
import { useSelector, useDispatch } from "react-redux"
import axios from "axios"
import handleCollect from "../Functions/handleCollect.js"
import CollectModal from "../components/CollectModal.jsx"
import DeleteHistoryButton from "../components/DeleteHistoryButton.jsx"

const UserHistory = () => {
    const userHistory = useSelector((state) => state.userHistory)
    const [displayModal, setDisplayModal] = useState(false)

    const dispatch = useDispatch()

    const handleHistory = () => {
        axios.get('/api/history')
            .then((res) => {
                dispatch({
                    type: "HISTORY_UPDATE",
                    payload: res.data.history
                })
            })
    }
    
    const allHistory = userHistory.map((his) => {
        return( 
            <li 
                key={his.usersCollectClickId} 
                id={his.usersCollectClickId}
                onClick={() => handleCollect(his.collectibleId, setDisplayModal, dispatch)}
                className="otherButton flow-root rounded-full pb-1 pt-2 px-2 my-1"
            >{his.collectible.title}</li>
        )
    })

    useEffect(handleHistory, [])

    return(
        <div className="h-[94vh] overflow-auto flex justify-center bg-gradient-to-br from-cWDark to-cWLight items-start">
            { displayModal && 
                <CollectModal displayModal={displayModal} setDisplayModal={setDisplayModal}/>
            }
            <div className="flex flex-col justify-center items-center md:w-[520px]">
                <h1 className="text-mBrDark text-3xl text-center mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark w-full">User History</h1>
                <ul className="flex flex-col text-center justify-center md:w-[520px]">
                    {allHistory}
                </ul>
                <DeleteHistoryButton />
            </div>
        </div>
    )
}

export default UserHistory