import { useState } from "react"
import axios from "axios"
import handleCollect from "../Functions/handleCollect"
import { useDispatch } from "react-redux"
import CollectModal from "../components/CollectModal"

function SearchBar() {
    const [query, setQuery] = useState('')
    const [columnType, setColumnType] = useState('title')
    const [searchResults, setSearchResults] = useState([])
    const [displayModal, setDisplayModal] = useState(false)
    const [error, setError] = useState('')
    const [displayError, setDisplayError] = useState(false)

    const dispatch = useDispatch()

    const handleSearch = (e) => {
        e.preventDefault()
        setSearchResults([])
        setDisplayError(false)
        axios.post('/api/search', {
            query,
            columnType
        })
            .then((res) => {
                if (res.data.success) {
                    setSearchResults(res.data.searchResults)
                } else {
                    setError(res.data.message)
                    setDisplayError(true)
                }
                setQuery('')
                setColumnType('title')
            })
    }

    const allResults = searchResults.map((col) => {
        return (<li 
            key={col.collectibleId}
            onClick={() => handleCollect(col.collectibleId, setDisplayModal, dispatch)}
            className="cursor-pointer text-blue-700 underline"
        >{col.title}</li>)  
    })

  return (
    <>
        { displayModal && 
            <CollectModal setDisplayModal={setDisplayModal} />
        }
        <div>Search Bar</div>
        <form onSubmit={(e) => handleSearch(e)}>
            <input 
                type="text"
                value={query}
                placeholder="Enter search here"
                onChange={(e) => setQuery(e.target.value)}
                className="bg-gray-400/40 border-black border-[1px]"
            />
            <select 
                name="columns" 
                id="columns"
                value={columnType}
                onChange={(e) => setColumnType(e.target.value)}
                className="bg-gray-400/40 border-black border-[1px]"
            >
                <option value="title">Title</option>
                <option value="reward">Reward</option>
                <option value="prerequisites">Prerequisites</option>
                <option value="description">Description</option>
                <option value="all">All</option>

            </select>
            <input 
                type="submit"
                className="border-black border-[1px]" 
            />
        </form>
        <ul>
            { displayError && 
                <li>{error}</li>
            }
            {allResults}
        </ul>
    </>
  )
}

export default SearchBar