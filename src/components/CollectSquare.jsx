import axios from "axios"
import { useDispatch } from "react-redux"


const CollectSquare = ({ id, setDisplayModal }) => {

    const dispatch = useDispatch()

    const handleCollect = (id) => {
        axios.get(`/api/collect/${id}`)
        .then((res) => {
            console.log(res.data)
            if (res.data.collectible) {
                axios.post('/api/addHistory', {
                    collectibleId: id
                })
                dispatch({
                    type: "COLLECT_UPDATE",
                    payload: res.data.collectible
                })
            setDisplayModal(true)
            } else {
                console.error("Information not found")
            }
        })
    }

    return (
        <section 
            id={id} 
            onClick={() => handleCollect(id)}
            className="w-[0.631vw] h-[1.315vh] border-[3px] border-red-700 p-0 m-0 hover:bg-red-500/40 hover:cursor-pointer">

        </section>
    )
}

export default CollectSquare