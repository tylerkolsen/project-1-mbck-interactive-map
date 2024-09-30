import axios from "axios"
import { useDispatch } from "react-redux"
import handleCollect from "../Functions/handleCollect.js"
import { useState, useEffect } from "react"


const CollectSquare = ({ id, setDisplayModal, width }) => {

    const dispatch = useDispatch()

    return (
        <section 
            id={id} 
            onClick={() => handleCollect(id, setDisplayModal, dispatch)}
            className={`h-[1.586vh] p-0 m-0 hover:cursor-pointer hover:bg-hRLight/30 rounded-sm border-[1px] border-hRLight border-dashed
                md:border-none
                `}
            style={{width: `${width}`}}

            // h-[14.55px] w-[14.575px]

            // This is the original version of className that I was using
            // className={`w-[0.77vw] h-[1.612vh] border-[3px] border-red-700 p-0 m-0 hover:bg-red-500/40 hover:cursor-pointer scale-${scaleValue}`}

        ></section>
    )
}

export default CollectSquare