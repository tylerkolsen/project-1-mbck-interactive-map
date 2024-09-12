import { useState } from "react"
import axios from "axios"

function AddNoteButton() {
    const [displayAdd, setDisplayAdd] = useState(false)

    const handleAddNote = () => {

    }

  return (
    <button 
        onClick=""
        className="border-[1px] border-black mb-1 mx-4"
    >Add a Note</button>
  )
}

export default AddNoteButton