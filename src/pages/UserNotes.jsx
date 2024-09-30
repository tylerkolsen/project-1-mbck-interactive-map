import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import CollectModal from "../components/CollectModal.jsx"
import handleCollect from "../Functions/handleCollect.js"
import EditNoteSetup from "../components/EditNoteSetup.jsx"
import axios from "axios"


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
                <li key={`${note.noteId} nest`}>
                   <ul className="flex flex-row items-center space-x-2 px-2 py-1">
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
                        className="cursor-pointer text-mBrDark border-mBrDark bg-mGLight border-[2px] pb-1 pt-2 px-2 rounded-full my-1"
                    >{note.collectible.title}</li>
                    <li key={`${note.noteId}Parent`}>
                        <ul className="flex flex-row items-center space-x-2 px-2 pt-2 pb-1">
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
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <div className="flex flex-col text-center md:w-[66vw] mx-2">
                <h1 className="text-mBrDark text-3xl text-center mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark w-full"
                >User Notes</h1>
                <ul>
                    {allNotes}
                </ul>
            </div>  
        </div> 
    )
}

export default UserNotes