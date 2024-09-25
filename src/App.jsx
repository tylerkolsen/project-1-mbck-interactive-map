import Header from "./components/Header"
import { Outlet } from "react-router-dom"
import { useSelector } from "react-redux"
import { useEffect } from "react"
import { useNavigate } from "react-router-dom"


function App() {
  const userId = useSelector((state) => state.userId)

  const navigate = useNavigate()

  useEffect(() => {
    if (!userId) {
        navigate('/')
    }
  }, [userId])

  return (
    <>
      {userId && 
        <Header />
      }

        <main className="h-full w-full flex justify-center overflow-x-auto">
         <Outlet />
        </main>

    </>
  )
}

export default App
