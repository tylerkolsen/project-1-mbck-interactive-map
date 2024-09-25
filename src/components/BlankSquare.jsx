const BlankSquare = ({ id, scaleValue }) => {
  return (
    <section
      id={id}
      className={`m-0 h-[14.55px] w-[14.58px] border-[1px] border-black p-0`}

      // This is the original version of className that I was using
      // className={`m-0 h-[1.612vh] w-[0.77vw] border-[1px] border-black p-0 scaleValue=${scaleValue}`}
    ></section>
  );
};

export default BlankSquare;
