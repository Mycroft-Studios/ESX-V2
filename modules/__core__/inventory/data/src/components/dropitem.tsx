import React, { useMemo, useRef } from "react";
import { useDrop } from "react-dnd";

import styled from "styled-components";

const StyledDrop = styled.div`
  width: 20%;
  padding-top: 4px;
  padding-bottom: 4px;
  line-height: 32px;
  font-size: 32px;
  border: solid 1px grey;
  border-radius: 20px;
  color: orange;
  text-align: center;
  margin: auto;
  margin-top: 8px;
  margin-bottom: 8px;
`;

type DropProps = {
  onDrop: (item: any) => void;
};

export const Drop: React.FC<DropProps> = ({
  children,
  onDrop,
}) => {
  const [{ isOver }, drop] = useDrop({
    accept: "item",
    drop: onDrop,
    collect: (monitor) => ({
      isOver: monitor.isOver(),
      canDrop: monitor.canDrop(),
    }),
  });

  const style: React.CSSProperties = useMemo(() => {
    return {
      backgroundColor: isOver ? "orange" : "initial",
      color: isOver ? "white" : "orange",
    };
  }, [isOver]);

  return (
    <StyledDrop style={style} ref={drop}>
      {children}
    </StyledDrop>
  );
};
