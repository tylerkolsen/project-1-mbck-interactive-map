import { useControls } from "react-zoom-pan-pinch"

function Controls() {
    const { zoomIn, zoomOut, resetTransform } = useControls()

  return (
    <div className="p-3 space-x-2 justify-center rounded-lg absolute z-10 ">
      <button 
        className="otherButton rounded-full px-[13px] pt-[2px]" 
        onClick={() => zoomIn()}>+</button>
      <button 
        className="otherButton rounded-full px-4 pt-[2px]"
        onClick={() => zoomOut()}>-</button>
      <button 
        className="otherButton rounded-full px-3 pt-[2px]"
        onClick={() => resetTransform()}>Reset</button>
    </div>
  )
}

export default Controls