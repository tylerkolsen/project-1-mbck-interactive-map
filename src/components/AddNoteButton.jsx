import { useState } from "react"
import { useSelector, useDispatch } from "react-redux"
import axios from "axios"

function AddNoteButton() {
    const collectibleId = useSelector((state) => state.collectInfo.collectibleId)

    const [displayAdd, setDisplayAdd] = useState(false)
    const [note, setNote] = useState('')

    const dispatch = useDispatch()

    const handleAddNote = (e) => {
        e.preventDefault()

        axios.post('/api/addNote', {
            collectibleId,
            description: note
        })
            .then((res) => {
                if (res.data.success) {
                    axios.get(`/api/collect/${collectibleId}`)
                    .then((res) => {
                        if (res.data.collectible) {
                            dispatch({
                                type: "COLLECT_UPDATE",
                                payload: res.data.collectible
                            })
                        } else {
                            console.error("Information not found")
                        }
                    })
                    setNote('')
                    setDisplayAdd(false)
                }
                 // This is to update the redux store with the value of notes, so that UserNotes.jsx will update with your newly added note, even from that menu
                axios.get('/api/notes')
                .then((res) => {
                    dispatch({
                        type: "NOTE_UPDATE",
                        payload: res.data.notes
                    })
                })
        })
    }

  return displayAdd ? (
    <form 
        onSubmit={(e) => handleAddNote(e)}
        className="flex flex-col place-items-auto"
    >
        <textarea
            placeholder="Add your note here"
            value={note}
            onChange={(e) => setNote(e.target.value)}
            className="resize-y"
        ></textarea>
        <input 
            type="submit" 
            className="otherButton w-[75%] self-center rounded-full px-2 pt-[2px] mx-2 mt-1"
        />
        <button 
            onClick={() => setDisplayAdd(false)}
            className="otherButton w-[75%] self-center rounded-full px-2 pt-[2px]  mx-2 mb-2 mt-1"
            
        >Cancel</button>
    </form>

  ) : (
    <button 
        onClick={() => setDisplayAdd(true)}
        className="otherButton w-[75%] self-center rounded-full px-2 pt-[2px] m-2"
    >Add a Note</button>
  )
}

export default AddNoteButton