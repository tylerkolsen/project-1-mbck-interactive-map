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
        className="cursor-pointer border-mBrDark border-[2px] px-[13px] pt-[2px] m-3 rounded-full bg-mGLight text-mBrDark shadow-md shadow-onyx/25
        transition duration-150
        hover:bg-mBrDark hover:text-mGLight hover:scale-105 active:scale-100"
    >Delete History</button>
  )
}

export default DeleteHistoryButton