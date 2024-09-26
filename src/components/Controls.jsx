import { TransformWrapper, TransformComponent, useControls } from "react-zoom-pan-pinch"

function Controls() {
    const { zoomIn, zoomOut, resetTransform } = useControls()

  return (
    <div className="p-3 space-x-2 justify-center rounded-lg absolute z-10">
      <button className="border-black border-[1px] px-3 rounded-lg bg-white" 
        onClick={() => zoomIn()}>+</button>
      <button className="border-black border-[1px] px-3 rounded-lg bg-white"
        onClick={() => zoomOut()}>-</button>
      <button className="border-black border-[1px] px-3 rounded-lg bg-white"
        onClick={() => resetTransform()}>Reset</button>
    </div>
  )
}

export default Controls