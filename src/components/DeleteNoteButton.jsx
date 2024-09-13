import { IoTrashOutline } from "react-icons/io5"
import axios from "axios"
import { useDispatch } from "react-redux"

function DeleteNoteButton({ noteId }) {

    const dispatch = useDispatch()

    console.log(noteId)

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
        onClick={() => handleDelete(noteId)}
    ><IoTrashOutline /></button>
  )
}

export default DeleteNoteButton