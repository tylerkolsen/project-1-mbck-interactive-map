import Header from "./components/Header"
import InteractiveTable from "./components/InteractiveTable"
import { Outlet } from "react-router-dom"

function App() {


  return (
    <>
      <Header />
      <main>
        <body>
          <Outlet />
        </body>
      </main>
    </>
  )
}

export default App
