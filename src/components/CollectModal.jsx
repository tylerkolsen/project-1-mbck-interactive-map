import { useSelector } from "react-redux"
import { IoIosCloseCircle } from "react-icons/io";

function CollectModal({ setDisplayModal }) {
    const collectInfo = useSelector((state) => state.collectInfo)
    const { title, reward, prerequisites, picture, notes, description} = collectInfo

    const allNotes = notes.map((note) => {
        return <li key={note.noteId} id={note.noteId}>{note.description}</li>
    })

  return (
    <div
        id="modalDiv" 
        onClick={() => setDisplayModal(false)}
        className="absolute z-10 w-[100vw] h-[94vh] flex bg-gray-500/50 items-center justify-center">
        <div className="flex flex-col w-[25vw] h-[70vh] bg-white rounded-md border-[1px] shadow-md justify-around overflow-auto">
            {/* <button 
                onClick={() => setDisplayModal(false)}
                className="self-end px-4 pt-4"
            >
                <IoIosCloseCircle size={18} />
            </button> */}
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
        </div>
    </div>
  )
}

export default CollectModal