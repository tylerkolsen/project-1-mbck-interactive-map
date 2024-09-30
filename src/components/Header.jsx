import { NavLink, useNavigate } from "react-router-dom"
import LogoutButton from "./LogoutButton"

import NotesButton from "./NotesButton.jsx"
import HistoryButton from "./HistoryButton.jsx"
import { RxHamburgerMenu } from "react-icons/rx";
import { useState } from "react";
import MobileMenu from "./MobileMenu.jsx";
import { useDispatch } from "react-redux";

const Header = () => {
    const [displayMobileMenu, setDisplayMobileMenu] = useState(false)

    return(
        <>
            <nav className="h-[6vh] border-b-[2px] border-hRDark z-30 sticky top-0 flex flex-row justify-center md:justify-end items-center bg-gradient-to-br from-mYDark to-mYLight">
                <ul className="flex md:hidden flex-row h-[4vh] items-center space-x-10">
                    <li>
                        <h2
                            className="flex md:hidden text-mBrDark text-2xl pt-[6px] flex-1"
                        >MBCK Interactive</h2>
                    </li>
                    <li className="bg-mGLight border-mBrDark border-[2px] rounded-lg p-1 flex-none">
                        <RxHamburgerMenu 
                            size={20}
                            className="text-mBrDark"
                            onClick={() => setDisplayMobileMenu(!displayMobileMenu)}/>
                    </li>
                </ul>
                <h2
                    className="hidden md:flex text-mBrDark text-2xl pt-[6px] ps-6 ms-10 flex-1"
                >MBCK Interactive</h2>
                <div
                    className="hidden md:flex flex-row px-8 py-1 space-x-10 me-10 flex-none"
                >
                    <NavLink
                        to={'/Home'}
                        className={({ isActive }) => 
                            isActive ? "menuButtonActive" 
                            : "menuButton"                            
                        }
                    >Map                
                    </NavLink>
                    <NavLink
                        to={'/History'}
                        className={({ isActive }) => 
                            isActive ? "menuButtonActive" 
                            : "menuButton"                            
                        }
                    >History               
                    </NavLink>
                    <NavLink
                        to={'/Note'}
                        className={({ isActive }) => 
                            isActive ? "menuButtonActive" 
                            : "menuButton"                            
                        }
                    >Notes               
                    </NavLink>
                    <NavLink
                        to={'/Search'}
                        className={({ isActive }) => 
                            isActive ? "menuButtonActive" 
                            : "menuButton"                            
                        }
                    >Search                
                    </NavLink>
                    <NavLink
                        className="menuButton"
                    >
                        <LogoutButton/>
                    </NavLink>

                </div>
                {/* <ul 
                    className="hidden md:flex flex-row px-8 py-1 space-x-10 me-10 flex-none"
                >
                    <li className="menuButton">
                        <NavLink
                            to={'/Home'}
                            className={({ isActive }) => 
                                isActive ? "menuButtonActive" 
                                : "menuButton"                            
                            }
                        >Map                
                        </NavLink>
                    </li>
                    <li className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark">
                        <HistoryButton />
                    </li>
                    <li className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark">
                        <NotesButton />
                    </li>
                    <li className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark">
                        <button
                            onClick={() => navigate('/Search')}
                        >Search</button>
                    </li>
                    <li className="border-[2px] border-mBrDark rounded-full px-2 pt-[2px] hover:bg-gray-500/50 focus-within:bg-gray-500/50 bg-mGLight text-mBrDark">
                        <LogoutButton />
                    </li>
                </ul> */}
            </nav>
            { displayMobileMenu && 
                <MobileMenu setDisplayMobileMenu={setDisplayMobileMenu}/>
            }
        </> 
    )
}

export default Header