import { useState } from "react"
import { useDispatch } from "react-redux"
import axios from "axios"
import DeleteNoteButton from "./DeleteNoteButton"
import { HiOutlinePencilSquare } from "react-icons/hi2"

function EditNoteSetup({ noteId }) {
  const [note, setNote] = useState('')
  const [displayEdit, setDisplayEdit] = useState(false)

  const dispatch = useDispatch()

  const handleEditNote = (e) => {
    e.preventDefault()

    axios.put('/api/editNote', {
      noteId,
      description: note
    })
      .then(() => {
        axios.get('/api/notes')
          .then((res) => {
            dispatch({
              type: "NOTE_UPDATE",
              payload: res.data.notes
            })
          })
          setNote('')
          setDisplayEdit(false)
      })

  }

  return(
    <>
      <li><HiOutlinePencilSquare 
          onClick={() => setDisplayEdit(!displayEdit)}
          className="cursor-pointer"
      /></li>
      <li><DeleteNoteButton noteId={noteId} /></li>

      { displayEdit && 
      <form onSubmit={(e) => handleEditNote(e)}>
      <input 
            type="textarea" 
            placeholder="Add your note here"
            value={note}
            onChange={(e) => setNote(e.target.value)}
            className="bg-gray-400/40 border-black border-[1px] mb-1 mx-4"
        />
        <input 
            type="submit" 
            className="border-[1px] border-black mb-1 mx-4 cursor-pointer"
        />
      </form>
      }
    </>
  )
}

export default EditNoteSetup