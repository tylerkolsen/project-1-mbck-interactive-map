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

        <main className="h-full flex justify-center overflow-x-auto bg-no-repeat">
         <Outlet />
        </main>

    </>
  )
}

export default App
