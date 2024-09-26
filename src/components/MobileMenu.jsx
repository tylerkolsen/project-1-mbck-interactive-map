import HistoryButton from "./HistoryButton.jsx"
import NotesButton from "./NotesButton.jsx"
import LogoutButton from "./LogoutButton.jsx"
import { useNavigate } from "react-router-dom"

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
    <div className="absolute md:hidden bg-white flex justify-center items-center h-[94vh] w-full z-40">
      <ul className="flex flex-col h-[86vh] w-24 justify-evenly items-center border-[1px] border-black rounded-full">
        <li className="border-[1px] border-black rounded-full px-2 py-1 active:bg-gray-500/50">
        <button
            onClick={handleHome}
        >Map</button> 
        </li>
        <li className="border-[1px] border-black rounded-full px-2 py-1 active:bg-gray-500/50">
            <HistoryButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
        <li className="border-[1px] border-black rounded-full px-2 py-1 active:bg-gray-500/50">
            <NotesButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
        <li className="border-[1px] border-black rounded-full px-2 py-1 active:bg-gray-500/50">
            <button
                onClick={handleSearch}
            >Search</button>
        </li>
        <li className="border-[1px] border-black rounded-full px-2 py-1 active:bg-gray-500/50">
            <LogoutButton setDisplayMobileMenu={setDisplayMobileMenu}/>
        </li>
      </ul>
    </div>
    
  )
}

export default MobileMenu