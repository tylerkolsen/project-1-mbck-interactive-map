import BlankSquare from "../components/BlankSquare.jsx"
import CollectSquare from "../components/CollectSquare.jsx"
import collectSet from "../../Backend/collectSet.js"
import CollectModal from "../components/CollectModal.jsx"
import { useState } from "react"
import Controls from "../components/Controls.jsx"
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch"

const InteractiveTable = () => {
    const [displayModal, setDisplayModal] = useState(false)
    const [scaleValue, setScaleValue] = useState("100")

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
                scaleValue={scaleValue}
            />
            : <BlankSquare 
                key={idNum} 
                id={idNum} 
                scaleValue={scaleValue}
            />
        )
    })        

    return (
        <>
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            {/* <TransformWrapper 
                limitToBounds={true}
            >
                <Controls />
                <TransformComponent> */}
                    <div className="overflow-x-auto">
                        <img 
                            src="public/mbck-map-HD.png" 
                            alt="" 
                            className="h-[94vh] w-auto"
                        />
                    {/* <div className={`h-[94%] bg-map bg-contain overflow-auto bg-no-repeat bg-center z-0 rounded-md`}> */}
                        {/* <div className="flex flex-row h-[94vh] place-items-center absolute start-[7.78vw] top-[3.8vh]">
                            <div className=" grid grid-cols-103 gap-[1px] auto-rows-min place-items-center">
                                {grid}
                            </div>
                        </div> */}
                    {/* </div> */}
                    </div>
                {/* </TransformComponent>
            </TransformWrapper> */}
                    
        </>
    )
}

export default InteractiveTable