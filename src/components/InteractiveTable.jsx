import BlankSquare from "./BlankSquare"
import CollectSquare from "./CollectSquare"
import collectSet from "../../Backend/collectSet"
import { useSelector } from "react-redux"
import { useEffect } from "react"
import { useNavigate } from "react-router-dom"


const InteractiveTable = () => {
    const userId = useSelector((state) => state.userId)

    const navigate = useNavigate()


    const gridConstruct = () => {
        let gridArr = []
        for (let i = 1; i < 4945; i++) {
            gridArr.push(i)
        }
        return gridArr
    }
    
    const grid = gridConstruct().map((idNum) => {
        return (
            collectSet.has(idNum) ?
            <CollectSquare key={idNum} id={idNum} />
            : <BlankSquare key={idNum} id={idNum} />
        )
    })

    // This runs sessionCheck on initial render, which will see if the user still has a userId in the session cookie.
    useEffect(() => {
        if (!userId) {
            navigate('/')
        }
    }, [userId])
        

    return (
        <div className="h-[94vh] w-[100vw] bg-map bg-contain bg-no-repeat bg-center">
            <div className="flex flex-row h-[94vh] w-[100vw] place-items-center absolute start-[15.67vw] top-[5.6vh]">
                <div className=" grid grid-cols-103 gap-[0.0425vw] auto-rows-min place-items-center">
                    {grid}
                </div>
            </div>
        </div>
    )
}

export default InteractiveTable