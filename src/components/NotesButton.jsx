import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"
import axios from "axios"

function NotesButton() {

    const dispatch = useDispatch()
    const navigate = useNavigate()

    // This function handles loading all of the user's notes to the redux store
    const handleNote = () => {
        axios.get('/api/notes')
            .then((res) => {
                dispatch({
                    type: "NOTE_UPDATE",
                    payload: res.data.notes
                })
            navigate('/Note')
            })
    }

    return (
        <button
            onClick={handleNote}
        >Notes</button>
    )
}

export default NotesButton