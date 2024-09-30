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
        ></section>
    )
}

export default CollectSquare