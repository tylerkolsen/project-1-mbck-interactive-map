import { useState, useEffect } from "react";

const BlankSquare = ({ id, width }) => {

  return (
    <section
      id={id}
      className={`h-[1.586vh] p-0 m-0`}
      style={{width: `${width}`}}
      // h-[14.55px] w-[14.575px]

      // This is the original version of className that I was using
      // className={`m-0 h-[1.612vh] w-[0.77vw] border-[1px] border-black p-0 scaleValue=${scaleValue}`}
    ></section>
  );
};

export default BlankSquare;
