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
        className="bg-mGLight border-mBrDark text-mBrDark rounded-lg border-[2px] p-1 shadow-inner shadow-onyx/25
        transition duration-150 
        hover:bg-mBrDark hover:first:text-mGLight hover:scale-105 active:scale-100"
        onClick={() => handleDelete(noteId)}
    ><IoTrashOutline size={20}/></button>
  )
}

export default DeleteNoteButton