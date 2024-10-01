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
        className="flex flex-col"
    >
        <textarea
            placeholder="Add your note here"
            value={note}
            onChange={(e) => setNote(e.target.value)}
            className="bg-gray-400/40 border-mBrDark text-mBrDark rounded-lg border-[1px] mb-1 mx-3 pt-1 ps-1 resize-y"
        ></textarea>
        <input 
            type="submit" 
            className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark mx-2 mt-1 cursor-pointer"
        />
        <button 
            onClick={() => setDisplayAdd(false)}
            className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark mx-2 mb-2 mt-1"
        >Cancel</button>
    </form>

  ) : (
    <button 
        onClick={() => setDisplayAdd(true)}
        className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark m-2"
    >Add a Note</button>
  )
}

export default AddNoteButton