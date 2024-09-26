import { useNavigate } from "react-router-dom"
import LogoutButton from "./LogoutButton"

import NotesButton from "./NotesButton.jsx"
import HistoryButton from "./HistoryButton.jsx"
import { RxHamburgerMenu } from "react-icons/rx";
import { useState } from "react";
import MobileMenu from "./MobileMenu.jsx";

const Header = () => {
    const [displayMobileMenu, setDisplayMobileMenu] = useState(false)

    const navigate = useNavigate()

    return(
        <>
            <nav className="h-[6vh] border-b-2 z-30 sticky top-0 bg-white flex flex-row justify-center items-center">
                <ul className="flex md:hidden flex-row h-[4vh] justify-evenly items-center">
                    <li><RxHamburgerMenu onClick={() => setDisplayMobileMenu(!displayMobileMenu)}/></li>
                </ul>
                <ul className="hidden md:flex flex-row w-[56vw] justify-between items-center border-[1px] border-black px-8 py-[6px] rounded-full">
                    <li className="border-[1px] border-black rounded-full px-2 hover:bg-gray-500/50 focus-within:bg-gray-500/50">
                        <button
                            onClick={() => navigate('/Home')}
                        >Map</button> 
                    </li>
                    <li className="border-[1px] border-black rounded-full px-2 hover:bg-gray-500/50 focus-within:bg-gray-500/50">
                        <HistoryButton />
                    </li>
                    <li className="border-[1px] border-black rounded-full px-2 hover:bg-gray-500/50 focus-within:bg-gray-500/50">
                        <NotesButton />
                    </li>
                    <li className="border-[1px] border-black rounded-full px-2 hover:bg-gray-500/50 focus-within:bg-gray-500/50">
                        <button
                            onClick={() => navigate('/Search')}
                        >Search</button>
                    </li>
                    <li className="border-[1px] border-black rounded-full px-2 hover:bg-gray-500/50 focus-within:bg-gray-500/50">
                        <LogoutButton />
                    </li>
                </ul>
            </nav>
            { displayMobileMenu && 
                <MobileMenu setDisplayMobileMenu={setDisplayMobileMenu}/>
            }
        </> 
    )
}

export default Header