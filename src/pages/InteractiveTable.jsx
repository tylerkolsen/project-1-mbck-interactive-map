import BlankSquare from "../components/BlankSquare.jsx"
import CollectSquare from "../components/CollectSquare.jsx"
import collectSet from "../../Backend/collectSet.js"
import CollectModal from "../components/CollectModal.jsx"
import { useState, useEffect } from "react"
import Controls from "../components/Controls.jsx"
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch"
import { useMeasure } from 'react-use'

const InteractiveTable = () => {
    const [ref, { width }] = useMeasure()

    const [displayModal, setDisplayModal] = useState(false)
    const [imgWidth, setImgWidth] = useState(width)

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
                width={`${imgWidth * 0.00875}px`}
            />
            : <BlankSquare 
                key={idNum} 
                id={idNum}
                width={`${imgWidth * 0.00875}px`} 
            />
        )
    })        

    useEffect(() => {
        setImgWidth(width)
    }, [width])

    return (
        <div className="h-full flex justify-center overflow-x-auto bg-no-repeat">
            { displayModal && 
                <CollectModal setDisplayModal={setDisplayModal}/>
            }
            <TransformWrapper 
                limitToBounds={true}
            >
                <Controls />
                <TransformComponent>
                    <div ref={ref} className="min-w-max z-0">
                        <img 
                            src="public/mbck-map-HD.png" 
                            alt="" 
                            className="h-[94vh] w-auto"
                        />
                    </div>
                    <div className={`h-[94vh] w-[97.3%] z-10 absolute start-[1.35%] top-[10.85%]`}>
                        {/* <div className="h-[94vh] w-full"> */}
                            <div className="grid grid-cols-103 gap-[0.1445%] place-items-center">
                                {grid}
                            </div>
                        {/* </div> */}
                    </div>

                </TransformComponent>
            </TransformWrapper>
                    
        </div>
    )
}

export default InteractiveTable