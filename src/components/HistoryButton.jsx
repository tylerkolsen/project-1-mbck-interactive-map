import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"
import axios from "axios"

function HistoryButton() {

    const dispatch = useDispatch()
    const navigate = useNavigate()

    // This function handles loading all of the user's history to the redux store
    const handleHistory = () => {
        axios.get('/api/history')
            .then((res) => {
                dispatch({
                    type: "HISTORY_UPDATE",
                    payload: res.data.history
                })
            navigate('/History')
            })
    }

  return (
    <button
        onClick={handleHistory}
    >History</button>
  )
}

export default HistoryButton