import { TransformWrapper, TransformComponent, useControls } from "react-zoom-pan-pinch"

function Controls() {
    const { zoomIn, zoomOut, resetTransform } = useControls()

  return (
    <div className="p-3 space-x-2 justify-center rounded-lg absolute z-10 ">
      <button 
        className="border-mBrDark border-[2px] px-[13px] pt-[2px] rounded-full bg-mGLight text-mBrDark shadow-md shadow-onyx/25
        transition duration-150
        hover:bg-mBrDark hover:text-mGLight hover:scale-105 active:scale-100" 
        onClick={() => zoomIn()}>+</button>
      <button 
        className="border-mBrDark border-[2px] px-4 pt-[2px] rounded-full bg-mGLight text-mBrDark shadow-md shadow-onyx/25
        transition duration-150
        hover:bg-mBrDark hover:text-mGLight hover:scale-105 active:scale-100"
        onClick={() => zoomOut()}>-</button>
      <button 
        className="border-mBrDark border-[2px] px-3 pt-[2px] rounded-full bg-mGLight text-mBrDark shadow-md shadow-onyx/25
        transition duration-150
        hover:bg-mBrDark hover:text-mGLight hover:scale-105 active:scale-100"
        onClick={() => resetTransform()}>Reset</button>
    </div>
  )
}

export default Controls