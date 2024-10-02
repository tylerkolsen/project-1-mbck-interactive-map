import { useState, useEffect } from "react"
import { useSelector, useDispatch } from "react-redux"
import axios from "axios"
import CollectModal from "../components/CollectModal.jsx"
import EditNoteSetup from "../components/EditNoteSetup.jsx"
import handleCollect from "../Functions/handleCollect.js"

const UserNotes = () => {
    const userNote = useSelector((state) => state.userNote)
    const [displayModal, setDisplayModal] = useState(false)

    const dispatch = useDispatch()

    // This function handles loading all of the user's notes to the redux store
    const handleNote = () => {
        axios.get('/api/notes')
            .then((res) => {
                dispatch({
                    type: "NOTE_UPDATE",
                    payload: res.data.notes
                })
            })
    }

    const allNotes = userNote.map((note, idx) => {
        if (idx !== 0 && note.collectible.title === userNote[idx - 1].collectible.title) {
            return (
                <li key={`${note.noteId}Nest`} id={`${note.noteId}Nest`}>
                   <ul
                        key={`${note.noteId}NestedUl`} 
                        className="flex flex-row items-center space-x-2 px-2 py-1"
                    >
                        <li 
                            key={note.noteId} 
                            id={note.noteId}
                            className="text-mBrDark flex-auto pt-2 text-left"
                        >{note.description}</li>
                        <EditNoteSetup 
                            noteId={note.noteId} 
                            className="flex-none"
                        />
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
                        className="otherButton rounded-full pb-1 pt-2 px-2 mt-2 mb-1" 
                    >{note.collectible.title}</li>
                    <li key={`${note.noteId}Parent`} id={`${note.noteId}Parent`}>
                        <ul 
                            key={`${note.noteId}NestedUl`}
                            className="flex flex-row items-center space-x-2 px-2 pt-2 pb-1">
                            <li 
                                key={note.noteId} 
                                id={note.noteId}
                                className="text-mBrDark flex-auto pt-2 text-left"
                            >{note.description}</li>
                            <EditNoteSetup 
                                noteId={note.noteId}
                                className="flex-none" 
                            />
                        </ul>
                    </li>
                </>
            )
    })

    useEffect(handleNote, [])

    return(
        <div className="h-[94vh] overflow-auto flex justify-center bg-gradient-to-br from-cWDark to-cWLight">
            { displayModal && 
                <CollectModal displayModal={displayModal} setDisplayModal={setDisplayModal}/>
            }
            <div className="flex flex-col text-center md:w-[66vw] mx-2">
                <h1 className="text-mBrDark text-3xl text-center mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark w-full"
                >User Notes</h1>
                <ul key="noteContainer" className="pb-4">
                    {allNotes}
                </ul>
            </div>  
        </div> 
    )
}

export default UserNotes