import axios from "axios"
import { useDispatch } from "react-redux"

function DeleteHistoryButton() {

    const dispatch = useDispatch()

    const handleDelete = () => {
        axios.delete('/api/deleteHistory')
            .then((res) => {
                console.log(res.data.message)
                dispatch({
                    type: "HISTORY_UPDATE",
                    payload: []
                })
            })
    }

  return (
    <button
        onClick={handleDelete}
        className="border-[1px] border-black mb-1 cursor-pointer"
    >Delete History</button>
  )
}

export default DeleteHistoryButton