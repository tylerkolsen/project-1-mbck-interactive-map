import BlankSquare from "./BlankSquare"
import CollectSquare from "./CollectSquare"
import collectSet from "../../Backend/collectSet"


const InteractiveTable = () => {

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