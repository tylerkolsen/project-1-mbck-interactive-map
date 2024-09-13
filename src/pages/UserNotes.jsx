import { useSelector } from "react-redux"
import { useState } from "react"
import CollectModal from "../components/CollectModal.jsx"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect.js"
import { HiOutlinePencilSquare } from "react-icons/hi2"
import EditNoteSetup from "../components/EditNoteSetup.jsx"

import DeleteNoteButton from "../components/DeleteNoteButton.jsx"

const UserNotes = () => {
    const userNote = useSelector((state) => state.userNote)
    const [displayModal, setDisplayModal] = useState(false)
    const [displayEdit, setDisplayEdit] = useState(false)

    const dispatch = useDispatch()

    const allNotes = userNote.map((note, idx) => {
        if (idx !== 0 && note.collectible.title === userNote[idx - 1].collectible.title) {
            return (
                <li key={`${note.noteId} nest`}>
                   <ul className="flex flex-row items-center">
                        <li key={note.noteId} id={note.noteId}>{note.description}</li>
                        <EditNoteSetup noteId={note.noteId} />
                    </ul>
                </li>
            )
        }
            return (
                <>
                    <li 
                        key={`${note.noteId}Title`} 
                        id={`${note.noteId}Title`}
                        onClick={() => handleCollect(note.collectibleId, setDisplayModal, dispatch)}
                        className="cursor-pointer text-blue-700 underline"
                    >{note.collectible.title}</li>
                    <li>
                        <ul className="flex flex-row items-center">
                            <li key={note.noteId} id={note.noteId}>{note.description}</li>
                            <EditNoteSetup noteId={note.noteId} />
                        </ul>
                    </li>
                </>
            )
    })

    return(
        <>
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <div>
                <h1>User Notes</h1>
                <ul>
                    {allNotes}
                </ul>
            </div>  
        </> 
    )
}

export default UserNotes