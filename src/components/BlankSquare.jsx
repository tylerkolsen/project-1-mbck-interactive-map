
const BlankSquare = ({ id, width }) => {

  return (
    <section
      id={id}
      className={`h-[1.586vh] p-0 m-0`}
      style={{width: `${width}`}}
    ></section>
  );
};

export default BlankSquare;
