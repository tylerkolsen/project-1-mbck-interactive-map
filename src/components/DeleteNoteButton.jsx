import { IoTrashOutline } from "react-icons/io5"
import axios from "axios"
import { useDispatch } from "react-redux"

function DeleteNoteButton({ noteId }) {

    const dispatch = useDispatch()

    const handleDelete = (noteId) => {
        axios.delete(`/api/deleteNote/${noteId}`)
            .then(() => {
                axios.get('/api/notes')
                    .then((res) => {
                        dispatch({
                            type: "NOTE_UPDATE",
                            payload: res.data.notes
                        })
                    })
            })
    }

  return (
    <button
    key={`${noteId}DeleteButton`}
        className="otherButton rounded-lg p-1"
        onClick={() => handleDelete(noteId)}
    ><IoTrashOutline size={20}/></button>
  )
}

export default DeleteNoteButton