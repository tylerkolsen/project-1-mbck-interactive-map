import { useDispatch } from "react-redux"
import axios from "axios"

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
        className="otherButton rounded-full px-[13px] pt-[2px] m-3 "
    >Delete History</button>
  )
}

export default DeleteHistoryButton