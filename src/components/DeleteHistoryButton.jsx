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
        className="cursor-pointer border-mBrDark border-[2px] px-[13px] pt-[2px] m-3 rounded-full bg-mGLight text-mBrDark"
    >Delete History</button>
  )
}

export default DeleteHistoryButton