import { useSelector } from "react-redux"
import { IoIosCloseCircle } from "react-icons/io";
import AddNoteButton from "./AddNoteButton.jsx";

function CollectModal({ setDisplayModal }) {
    const userId = useSelector((state) => state.userId)
    const collectInfo = useSelector((state) => state.collectInfo)
    const { title, reward, prerequisites, picture, notes, description} = collectInfo

    const allNotes = notes.map((note) => {
        if (note.userId === userId) {
            return <li key={note.noteId} id={note.noteId}>{note.description}</li>
        }
    })

    const handleModalChange = (e) => {
        console.log(e.target)
        console.log(!e.target.matches("button"))
        if (e.target.parentElement.matches("form") || e.target.matches("button") ) {
           return
        } 
        setDisplayModal(false)
    }

  return (
    <div
        id="modalDiv" 
        onClick={(e) => handleModalChange(e)}
        className="absolute z-10 w-[100vw] h-[94vh] snap-center flex bg-gray-500/50 items-center justify-center">
        <div 
            className="flex flex-col w-[25vw] h-[70vh] bg-white rounded-md shadow-md justify-between overflow-auto border-black border-[2px]">
            {/* <button 
                onClick={() => setDisplayModal(false)}
                className="self-end px-4 pt-4"
            >
                <IoIosCloseCircle size={18} />
            </button> */}
            <span className="bg-gray-500 border-b-[2px] border-black text-gray-500">S</span>
            <h1>{title}</h1>
            <label>Reward:
            </label>
            <p>{reward}</p>
            <label htmlFor="">Prerequisites:</label>
            <p>{prerequisites}</p>
            {/*this will require being changed to an img tag once entered in */}
            <p id="picture">{picture}</p>
            <label htmlFor="">How to obtain:</label>
            <p>{description}</p>
            <label htmlFor="">Notes:</label>
            <ul>
                {allNotes}
            </ul>
            <AddNoteButton />
        </div>
    </div>
  )
}

export default CollectModal