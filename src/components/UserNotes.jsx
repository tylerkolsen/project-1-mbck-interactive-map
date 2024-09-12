
import { useSelector } from "react-redux"


const UserNotes = () => {
    const userNote = useSelector((state) => state.userNote)

    const allNotes = userNote.map((note) => {
        return <li key={note.noteId} id={note.noteId}>{note.description}</li>
    })

    return(
        <div>
            <h1>User Notes</h1>
            <ul>
                {allNotes}
            </ul>
        </div>   
    )
}

export default UserNotes