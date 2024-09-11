import Header from "./components/Header"
import { Outlet } from "react-router-dom"
import { useSelector } from "react-redux"


function App() {
  const userId = useSelector((state) => state.userId)



  return (
    <>
      {userId && 
        <Header />
      }

        <main>
         <Outlet />
        </main>

    </>
  )
}

export default App
