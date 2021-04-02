import React, { useMemo, useRef } from "react";
import { useDrop } from "react-dnd";

import styled from "styled-components";

const StyledUse = styled.div`
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

type UseProps = {
  onDrop: (item: any) => void;
};

export const Use: React.FC<UseProps> = ({
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
    <StyledUse style={style} ref={drop}>
      {children}
    </StyledUse>
  );
};
