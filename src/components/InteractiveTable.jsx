import BlankSquare from "./BlankSquare"
import CollectSquare from "./CollectSquare"
import collectSet from "../../Backend/collectSet"
import CollectModal from "./CollectModal.jsx"
import { useSelector } from "react-redux"
import { useState } from "react"




const InteractiveTable = () => {
    const userId = useSelector((state) => state.userId)

    const [displayModal, setDisplayModal] = useState(false)

 


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
            <CollectSquare 
                key={idNum} 
                id={idNum} 
                setDisplayModal={setDisplayModal}
            />
            : <BlankSquare 
                key={idNum} 
                id={idNum} 
            />
        )
    })
        

    return (
        <>
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <div className="h-[94vh] w-[100vw] bg-map bg-contain bg-no-repeat bg-center z-0">
                <div className="flex flex-row h-[94vh] w-[100vw] place-items-center absolute start-[15.67vw] top-[5.6vh]">
                    <div className=" grid grid-cols-103 gap-[0.0425vw] auto-rows-min place-items-center">
                        {grid}
                    </div>
                </div>
            </div>
        </>
    )
}

export default InteractiveTable