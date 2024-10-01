import { useSelector } from "react-redux"
import AddNoteButton from "./AddNoteButton.jsx";

function CollectModal({ setDisplayModal }) {
    const userId = useSelector((state) => state.userId)
    const collectInfo = useSelector((state) => state.collectInfo)
    const { title, reward, prerequisites, notes, description} = collectInfo

    const allNotes = notes.map((note) => {
        if (note.userId === userId) {
            return <li key={note.noteId} id={note.noteId}>{note.description}</li>
        }
    })

    // selection to close the modal on click
    const handleModalChange = (e) => {
        if (e.target.parentElement.matches("form") || e.target.matches("button") || e.target.matches("textarea")) {
           return
        } 
        setDisplayModal(false)
    }

  return (
    <div
        id="modalDiv" 
        onClick={(e) => handleModalChange(e)}
        className="fixed z-20 w-[100vw] h-[94vh] snap-center flex bg-onyx/50 items-center justify-center">
        <div 
            className="flex flex-col w-[480px] max-h-[80vh] bg-gradient-to-br from-cWDark to-cWLight rounded-lg shadow-2xl shadow-black/50 overflow-auto border-mBrDark border-[2px] m-2">
            <h1
               className="bg-gradient-to-br from-mYDark to-mYLight border-b-[2px] border-mBrDark text-onyx pb-4 pt-5 px-2"
            >{title}</h1>
            <p className="px-2 pt-2 pb-1 text-mBrDark">
                <span className="text-onyx">Reward: </span>
                {reward}
            </p>
            <p className="px-2 py-1 text-mBrDark">
                <span className="text-onyx">Prerequisites: </span>
                {prerequisites}
            </p>
            <label
                className="px-2 py-1 text-onyx"
            >How to obtain:</label>
            <p
                className="px-2 py-1 text-mBrDark"
            >{description}</p>
            <label
                className="px-2 py-1 text-onyx"
            >Notes:</label>
            <ul
                className="px-2 py-1 text-mBrDark"
            >
                {allNotes}
            </ul>
            <AddNoteButton />
        </div>
    </div>
  )
}

export default CollectModal