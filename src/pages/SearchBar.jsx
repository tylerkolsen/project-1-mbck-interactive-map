import { useState, useEffect } from "react"
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
            className="cursor-pointer text-mBrDark border-mBrDark bg-mGLight border-[2px] pb-1 pt-2 px-2 rounded-full my-1"
        >{col.title}</li>)  
    })

  return (
    <>
        <div className="h-[94vh] overflow-auto flex justify-center bg-gradient-to-br from-cWDark to-cWLight">
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal} />
            }
            <div className="flex flex-col text-center">
                <h1 className="text-mBrDark text-3xl text-center mb-[6px] pb-[3px] pt-3 border-b-[2px] border-mBrDark w-full"
                >Search</h1>
                <form 
                    onSubmit={(e) => handleSearch(e)}
                    className="flex flex-col space-y-1"
                >
                    <textarea
                        placeholder="Enter search here"
                        value={query}
                        rows={1}
                        onChange={(e) => setQuery(e.target.value)}
                        className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1 w-[350px] resize-none"
                    ></textarea>
                    <select 
                        name="columns" 
                        id="columns"
                        value={columnType}
                        onChange={(e) => setColumnType(e.target.value)}
                        className="bg-gray-400/40 border-mBrDark text-mBrDark border-[1px] rounded-lg pt-1 ps-1"
                    >
                        <option value="title">Title</option>
                        <option value="reward">Reward</option>
                        <option value="prerequisites">Prerequisites</option>
                        <option value="description">Description</option>
                        <option value="all">All</option>

                    </select>
                    <input 
                        type="submit"
                        className="cursor-pointer text-mBrDark border-[2px] border-mBrDark bg-mGLight pb-1 pt-2 rounded-full" 
                    />
                </form>
                <ul
                    className="border-t-[2px] border-mBrDark mt-5 pt-5"
                >
                    { displayError && 
                        <li className="text-mBrDark">{error}</li>
                    }
                    {allResults}
                </ul>
            </div>
        </div>
    </>
  )
}

export default SearchBar