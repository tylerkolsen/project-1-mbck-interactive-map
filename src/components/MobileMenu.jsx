import HistoryButton from "./HistoryButton.jsx"
import NotesButton from "./NotesButton.jsx"
import LogoutButton from "./LogoutButton.jsx"
import { NavLink, useNavigate } from "react-router-dom"

function MobileMenu({ setDisplayMobileMenu }) {

  const navigate = useNavigate()

  const handleHome = () => {
    navigate('/Home')
    setDisplayMobileMenu(false)
  }

  const handleSearch = () => {
    navigate('/Search')
    setDisplayMobileMenu(false)
  }

  return (
    <div className="absolute md:hidden flex justify-center items-center h-[94vh] w-full z-40 bg-gradient-to-br from-cWDark to-cWLight">
      <ul className="flex flex-col h-[86vh] w-24 justify-evenly items-center">
        <li 
          className="border-[2px] border-mBrDark rounded-full px-2 w-[66vw] pb-2 pt-[10px] text-center text-lg active:bg-gray-500/50 bg-mGLight text-mBrDark"
        >
          <button
              onClick={handleHome}
          >Map</button> 
        </li>
        <li className="border-[2px] border-mBrDark rounded-full px-2 w-[66vw] pb-2 pt-[10px] text-center text-lg active:bg-gray-500/50 bg-mGLight text-mBrDark">
            <HistoryButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
        <li className="border-[2px] border-mBrDark rounded-full px-2 w-[66vw] pb-2 pt-[10px] text-center text-lg active:bg-gray-500/50 bg-mGLight text-mBrDark">
            <NotesButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
        <li className="border-[2px] border-mBrDark rounded-full px-2 w-[66vw] pb-2 pt-[10px] text-center text-lg active:bg-gray-500/50 bg-mGLight text-mBrDark">
            <button
                onClick={handleSearch}
            >Search</button>
        </li>
        <li className="border-[2px] border-mBrDark rounded-full px-2 w-[66vw] pb-2 pt-[10px] text-center text-lg active:bg-gray-500/50 bg-mGLight text-mBrDark">
            <LogoutButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
      </ul>
    </div>
    
  )
}

export default MobileMenu