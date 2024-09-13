import { useNavigate } from "react-router-dom"
import LogoutButton from "./LogoutButton"

import NotesButton from "./NotesButton.jsx"
import HistoryButton from "./HistoryButton.jsx"

const Header = () => {

    const navigate = useNavigate()

    return(
        <nav className="h-[6vh] border-b-2">
            <ul className="flex flex-row h-[6vh] justify-evenly items-center">
                <li>
                    <button
                        onClick={() => navigate('/Home')}
                    >Map</button> 
                </li>
                <li>
                    <HistoryButton />
                </li>
                <li>
                    <NotesButton />
                </li>
                <li>
                    <LogoutButton />
                </li>
            </ul>
        </nav>
        
    )
}

export default Header