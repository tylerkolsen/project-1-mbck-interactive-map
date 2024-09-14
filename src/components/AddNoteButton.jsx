import { useState } from "react"
import { useSelector } from "react-redux"
import axios from "axios"
import { useDispatch } from "react-redux"

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
        })
        
        // This is to update the redux store with the value of notes, so that UserNotes.jsx will update with your newly added note, even from that menu
        axios.get('/api/notes')
            .then((res) => {
                dispatch({
                    type: "NOTE_UPDATE",
                    payload: res.data.notes
                })
            })
    }

  return displayAdd ? (
    <form 
        onSubmit={(e) => handleAddNote(e)}
        className="flex flex-col"
    >
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
        <button 
            onClick={() => setDisplayAdd(false)}
            className="border-[1px] border-black mb-1 mx-4 cursor-pointer"
        >Cancel</button>
    </form>

  ) : (
    <button 
        onClick={() => setDisplayAdd(true)}
        className="border-[1px] border-black mb-1 mx-4"
    >Add a Note</button>
  )
}

export default AddNoteButton