import { useEffect } from "react"
import { Outlet } from "react-router-dom"
import { useSelector } from "react-redux"
import { useNavigate } from "react-router-dom"
import Header from "./components/Header"

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
        <main className="">
         <Outlet />
        </main>
    </>
  )
}

export default App
