import { NavLink } from "react-router-dom"
import LogoutButton from "./LogoutButton"
import { useDispatch } from "react-redux"
import axios from "axios"

const Header = () => {

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

    // This function handles loading all of the user's history to the redux store
    const handleHistory = () => {
        axios.get('/api/history')
            .then((res) => {
                dispatch({
                    type: "HISTORY_UPDATE",
                    payload: res.data.history
                })
            })
    }

    return(
        <nav className="h-[6vh] border-b-2">
            <ul className="flex flex-row h-[6vh] justify-evenly items-center">
                <li> 
                    <NavLink to="/Home">Map</NavLink>
                </li>
                <li>
                    <NavLink 
                        onClick={handleHistory}
                        to="/History"
                    >History</NavLink>
                </li>
                <li>
                    <NavLink 
                        onClick={handleNote}
                        to="/Note"
                    >Notes</NavLink>
                </li>
                <li>
                    <LogoutButton />
                </li>
            </ul>
        </nav>
        
    )
}

export default Header