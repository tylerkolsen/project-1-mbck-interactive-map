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
        className="bg-mGLight border-mBrDark rounded-lg border-[2px] p-1"
        onClick={() => handleDelete(noteId)}
    ><IoTrashOutline className="text-mBrDark" size={20}/></button>
  )
}

export default DeleteNoteButton