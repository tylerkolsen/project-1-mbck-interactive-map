import { NavLink } from "react-router-dom"
import LogoutButton from "./LogoutButton"

const Header = () => {


    return(
        <nav className="h-[6vh] border-b-2">
            <ul className="flex flex-row h-[6vh] justify-evenly items-center">
                <li> 
                    <NavLink to="/Home">Map</NavLink>
                </li>
                <li>
                    <NavLink to="/History">History</NavLink>
                </li>
                <li>
                    <NavLink to="/Note">Notes</NavLink>
                </li>
                <li>
                    <LogoutButton />
                </li>
            </ul>
        </nav>
        
    )
}

export default Header