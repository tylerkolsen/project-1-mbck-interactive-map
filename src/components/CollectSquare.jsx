import axios from "axios"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect.js"


const CollectSquare = ({ id, setDisplayModal, scaleValue }) => {

    const dispatch = useDispatch()

    return (
        <section 
            id={id} 
            onClick={() => handleCollect(id, setDisplayModal, dispatch)}
            className={`h-[14.55px] w-[14.58px] border-[3px] border-red-700 p-0 m-0 hover:bg-red-500/40 hover:cursor-pointer`}

            // This is the original version of className that I was using
            // className={`w-[0.77vw] h-[1.612vh] border-[3px] border-red-700 p-0 m-0 hover:bg-red-500/40 hover:cursor-pointer scale-${scaleValue}`}

        ></section>
    )
}

export default CollectSquare