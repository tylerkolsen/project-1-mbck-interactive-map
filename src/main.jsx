import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import {createBrowserRouter, createRoutesFromElements, Route, RouterProvider } from 'react-router-dom'
import { Provider } from 'react-redux'
import store from './assets/redux/store.js'
import App from './App.jsx'
import Landing from './pages/Landing.jsx'
import InteractiveTable from './pages/InteractiveTable.jsx'
import UserHistory from './pages/UserHistory.jsx'
import UserNotes from './pages/UserNotes.jsx'
import SearchBar from './pages/SearchBar.jsx'

const router = createBrowserRouter(
createRoutesFromElements(
  <Route path='/' element={<App />}>
    <Route index element={<Landing />} />
    <Route
      path='/Home'
      element={<InteractiveTable />}
    />
    <Route
      path='/History'
      element={<UserHistory />}
    />
    <Route
      path='/Note'
      element={<UserNotes />}
    />
    <Route
      path='/Search'
      element={<SearchBar />}
    />
  </Route>
)
)

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Provider store={store}>
      <RouterProvider router={router} />
    </Provider>
  </StrictMode>,
)
