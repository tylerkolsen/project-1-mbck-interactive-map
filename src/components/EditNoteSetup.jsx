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
      { displayEdit && 
      <form 
        onSubmit={(e) => handleEditNote(e)}
        className="flex flex-col justify-center"
      >
        <textarea
          placeholder="Add your note here"
          value={note}
          onChange={(e) => setNote(e.target.value)}
          className="bg-gray-400/40 border-mBrDark text-mBrDark rounded-lg border-[1px] mb-1 mx-3 pt-1 ps-1 resize"
        ></textarea>
        <input 
            type="submit" 
            className="border-[2px] border-mBrDark text-mBrDark bg-mGLight rounded-full pt-[2px] px-2 mb-1 mx-5 cursor-pointer"
        />
      </form>
      }
      <li>
        <button
          className="bg-mGLight border-mBrDark rounded-lg border-[2px] p-1"
        ><HiOutlinePencilSquare 
            size={20}
            onClick={() => setDisplayEdit(!displayEdit)}
            className="cursor-pointer text-mBrDark"
          />
        </button>
      </li>
      <li><DeleteNoteButton
            noteId={noteId} /></li>
    </>
  )
}

export default EditNoteSetup