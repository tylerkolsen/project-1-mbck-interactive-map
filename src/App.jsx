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
      <body>
        <main>
         <Outlet />
        </main>
      </body>
    </>
  )
}

export default App
