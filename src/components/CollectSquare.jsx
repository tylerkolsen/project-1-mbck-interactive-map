import axios from "axios"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect.js"


const CollectSquare = ({ id, setDisplayModal }) => {

    const dispatch = useDispatch()

    return (
        <section 
            id={id} 
            onClick={() => handleCollect(id, setDisplayModal, dispatch)}
            className="w-[0.631vw] h-[1.315vh] border-[3px] border-red-700 p-0 m-0 hover:bg-red-500/40 hover:cursor-pointer">

        </section>
    )
}

export default CollectSquare