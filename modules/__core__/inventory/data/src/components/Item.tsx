import React, { useEffect, useRef, useState } from "react";
import { DropTargetMonitor, useDrag, useDrop, XYCoord } from "react-dnd";
import { useNuiQuery } from "../hooks/useNuiQuery";
import MouseTooltip from 'react-sticky-mouse-tooltip';
import styled from "styled-components";

const StyledItem = styled.div`
  height: 128px;
  width: 128px;
  margin: 10px;

  position: relative;

  background-color: rgba(50, 50, 50, 0.8);
  border: 1px solid rgba(255, 255, 255, 0.1);
  &:hover {
    cursor: move;
  }
`;

const Quantity = styled.span`
  position: absolute;
  top: -2px;
  right: 2px;
  color: white;
`;

const Info = styled.span`
  height: 50px;
  width: 190px;
  background-color: rgba(0, 0, 0, 0.9);
  border: solid 1px rgba(102, 178, 255, 1);
  white-space: pre-wrap;
  color: white;
`;

type ItemProps = {
  index: number;
  item: { name: string; quantity: number};
  moveItem: (dragId: number, hoverId: number) => void;
};

export const Item: React.FC<ItemProps> = ({ index, moveItem, item }) => {
  const ref = useRef<HTMLDivElement>(null);

  const [imageUrl, setImageUrl] = useState();

  useEffect(() => {
    import(`assets/images/${item.name}.png`).then((value) => {
      setImageUrl(value.default);
    });
  }, [item.name]);

  const [, drop] = useDrop({
    accept: "item",
    hover(item: any, monitor: DropTargetMonitor) {
      if (!ref.current) {
        return;
      }
      const dragIndex = item.index;
      const hoverIndex = index;

      // Don't replace items with themselves
      if (dragIndex === hoverIndex) {
        return;
      }

      // Determine rectangle on screen
      const hoverBoundingRect = ref.current?.getBoundingClientRect();

      // Get horizontal middle
      const hoverMiddleX =
        (hoverBoundingRect.right - hoverBoundingRect.left) / 2;

      // Determine mouse position
      const clientOffset = monitor.getClientOffset();

      const hoverClientX = (clientOffset as XYCoord).x - hoverBoundingRect.left;

      if (dragIndex > hoverIndex && hoverClientX > hoverMiddleX) {
        return;
      }

      if (dragIndex < hoverIndex && hoverClientX < hoverMiddleX) {
        return;
      }

      // Time to actually perform the action
      moveItem(dragIndex, hoverIndex);

      item.index = hoverIndex;
    },
  });

  const [{ isDragging }, drag] = useDrag({
    item: { type: "item", index },
    collect: (monitor) => ({
      isDragging: monitor.isDragging(),
    }),
  });

  const opacity = isDragging ? 0.6 : 1;
  drag(drop(ref));

  const [useQuery] = useNuiQuery("use");
  function sayHello() {
     useQuery({name: item.name,quantity: 1});
  }

  const [dropQuery] = useNuiQuery("drop");
  function dropItem() {
     dropQuery({name: item.name,quantity: 1});
  }

  const [showHover, setShowHover] = React.useState(false);

  return (
    <StyledItem
      ref={ref}
      style={{
        opacity,
        backgroundImage: `url('${imageUrl}')`,
        zIndex: 1,
      }}
      onDoubleClick={sayHello}
      onContextMenu={dropItem}
      onMouseEnter={() => setShowHover(true)}
      onMouseLeave={() => setShowHover(false)}
    >
      <MouseTooltip
          visible={showHover}
          offsetX={15}
          offsetY={10}
        >
      <Info>
          Name |<text style={{color: '#009ACD'}}> {item.name} </text>
          {'\n'}
          Quantity | <text style={{color: '#009ACD'}}> {item.quantity} </text>
         </Info>
        </MouseTooltip>
    </StyledItem>
  );
};
