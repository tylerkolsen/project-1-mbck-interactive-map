import { useState } from "react"
import { useDispatch } from "react-redux"
import axios from "axios"
import { HiOutlinePencilSquare } from "react-icons/hi2"
import DeleteNoteButton from "./DeleteNoteButton"

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
        key={`${noteId}Form`}
        onSubmit={(e) => handleEditNote(e)}
        className="flex flex-col justify-center w-[140px] md:w-auto"
      >
        <textarea
          key={`${noteId}TextArea`}
          placeholder="Add your note here"
          value={note}
          onChange={(e) => setNote(e.target.value)}
          className="resize"
        ></textarea>
        <input
            key={`${noteId}Submit`} 
            type="submit" 
            className="otherButton rounded-full pt-[2px] px-2 mb-1 mx-5"
        />
      </form>
      }
      <li key={`${noteId}Edit`} id={`${noteId}Edit`}>
        <button
          key={`${noteId}EditButton`}
          className={`rounded-lg p-1
            ${ displayEdit 
                ? "otherButton !bg-mBrDark !text-mGLight"
                : "otherButton"
            }  
          `}
          onClick={() => setDisplayEdit(!displayEdit)}
        ><HiOutlinePencilSquare 
            size={20}
          />
        </button>
      </li>
      
      <li key={`${noteId}Delete`} id={`${noteId}Delete`}>
        <DeleteNoteButton
            noteId={noteId} /></li>
    </>
  )
}

export default EditNoteSetup