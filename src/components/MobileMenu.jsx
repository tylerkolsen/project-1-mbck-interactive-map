import LogoutButton from "./LogoutButton.jsx"
import { NavLink } from "react-router-dom"

function MobileMenu({ setDisplayMobileMenu }) {


  return (
    <div className="absolute md:hidden flex justify-center items-center h-[94vh] w-full z-40 bg-gradient-to-br from-cWDark to-cWLight">
      <nav className="flex flex-col h-[86vh] w-24 justify-evenly items-center">
        <NavLink
            to={'/Home'}
            onClick={() => setDisplayMobileMenu(false)}
            className={({ isActive }) => 
                isActive || location.pathname === "/" ?"menuMobileButtonActive" : "menuMobileButton"                         
            }
        >Map                
        </NavLink>
        <NavLink
            to={'/History'}
            onClick={() => setDisplayMobileMenu(false)}
            className={({ isActive }) => 
                isActive ? "menuMobileButtonActive" : "menuMobileButton"                         
            }
        >History               
        </NavLink>
        <NavLink
            to={'/Note'}
            onClick={() => setDisplayMobileMenu(false)}
            className={({ isActive }) => 
                isActive ? "menuMobileButtonActive" : "menuMobileButton"                            
            }
        >Notes               
        </NavLink>
        <NavLink
            to={'/Search'}
            onClick={() => setDisplayMobileMenu(false)}
            className={({ isActive }) => 
                isActive ? "menuMobileButtonActive" : "menuMobileButton"                            
            }
        >Search                
        </NavLink>
        <NavLink
            onClick={() => setDisplayMobileMenu(false)}
            className="menuMobileButton"
        >
            <LogoutButton/>
        </NavLink>

      </nav>
    </div>
    
  )
}

export default MobileMenu