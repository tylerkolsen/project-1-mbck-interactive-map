import { useState } from "react";
import { NavLink } from "react-router-dom";
import { RxHamburgerMenu } from "react-icons/rx";
import LogoutButton from "./LogoutButton.jsx";
import MobileMenu from "./MobileMenu.jsx";

const Header = () => {
    const [displayMobileMenu, setDisplayMobileMenu] = useState(false)

    return(
        <>
            <nav className="h-[6vh] border-b-[2px] border-mBrDark z-30 sticky top-0 flex flex-row justify-center md:justify-end items-center bg-gradient-to-br from-mYDark to-mYLight">
                <ul className="flex md:hidden flex-row h-[4vh] items-center space-x-10">
                    <li>
                        <h2
                            className="flex md:hidden text-mBrDark text-2xl pt-[6px] flex-1"
                        >MBCK Interactive</h2>
                    </li>
                    <li 
                        className={`rounded-lg p-1 flex-none
                        ${displayMobileMenu 
                            ? "otherButton !bg-mBrDark !text-mGLight"
                            : "otherButton"
                        }
                        `}
                        onClick={() => setDisplayMobileMenu(!displayMobileMenu)}
                    >
                        <RxHamburgerMenu 
                            size={20}
                        />
                    </li>
                </ul>
                <h2
                    className="hidden md:flex text-mBrDark pt-[6px] text-2xl ps-6 ms-10 flex-1 leading-none"
                >MBCK Interactive</h2>
                <div
                    className="hidden md:flex flex-row px-8 py-1 space-x-10 me-10 flex-none"
                >
                    <NavLink
                        to={'/Home'}
                        className={({ isActive }) => 
                            isActive || location.pathname === "/" ? "menuButtonActive" 
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
            </nav>
            { displayMobileMenu && 
                <MobileMenu setDisplayMobileMenu={setDisplayMobileMenu}/>
            }
        </> 
    )
}

export default Header