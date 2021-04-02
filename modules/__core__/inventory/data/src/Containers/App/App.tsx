import React, { useCallback, useEffect, useMemo, useState } from "react";
import { DndProvider } from "react-dnd";
import { TouchBackend } from "react-dnd-touch-backend";
import styled from "styled-components";
import { Item } from "../../components/Item";
import update from "immutability-helper";
import { PlayerTarget } from "../../components/PlayerTarget";
import { Use } from "../../components/useitem";
import { Drop } from "../../components/dropitem";
import { RangeSelectorModal } from "../../components/RangeSelectorModal";
import { playerInventoryMock } from "../../mocks/player-inventory-mock";
import { nearPlayersMock } from "../../mocks/near-players.mock";
import { useIsBrowser } from "../../hooks/useIsBrowser";
import { useNuiQuery } from "../../hooks/useNuiQuery";
import { useNuiEvent } from "../../hooks/useNuiEvent";
import { ItemPreview } from "../../components/ItemPreview";
import { hasItemsPositionChanged } from "../../utils/has-items-position-changed";

const Container = styled.div`
  display: flex;
  flex-direction: row;
  padding: 5px;
`;

const Header = styled.div`
  height: 7vh;
  color: white;
  white-space: pre-wrap;
  border-bottom: 4px solid rgba(65, 65, 65, 0.7);
  font-size: 23px;
  padding-bottom: 7px;
  padding-left: 2px;
`;

const Info = styled.div`
  color: white;
  text-align: right;
  position: absolute;
  right: 2%;
  top: 1%;
`;

const ItemsContainer = styled.div`
  display: flex;
  flex-wrap: wrap;

  max-height: 83vh;

  overflow-y: scroll;

  /* Track */
  ::-webkit-scrollbar-track {
    background: rgba(0, 128, 255, 0.2) !important;
  }

  /* Handle */
  ::-webkit-scrollbar-thumb {
    background: orange;
  }

  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
    background: #555;
  }
`;

const InventoryContainerAlone = styled.div`
  background-color: rgba(0, 0, 0, 0.9);
  position: absolute;
  overflow-y: hidden;
  height: 97vh;
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  flex-grow: 3;
  margin: 5px;
  width: 47%;
  left: 1%;
  flex-basis: 0;
`;

const InventoryContainer = styled.div`
background-color: rgba(0, 0, 0, 0.9);
position: absolute;
overflow-y: hidden;
height: 97vh;
border-radius: 12px;
border: 1px solid rgba(255, 255, 255, 0.1);
flex-grow: 3;
margin: 5px;
width: 47%;
right: 1%;
flex-basis: 0;
`;

export type Item = { name: string; quantity: number};
export type Name = { name: string};
export type ID = { id: string};
export type Capacity = { lengh: number };
export type Player = { distance: number; playerId: string };


const App = () => {
  const [modalMetadata, setModalMetadata] = useState<{
    targetPlayer?: { distance: number; playerId: string };
    itemCount?: number;
    item?: { name: string; quantity: number};
    isOpen: boolean;
  }>({ isOpen: false });

  const isBrowser = useIsBrowser();

  const [items, setItems] = useState<Item[]>([]);
  const [itemsother, setOtherItems] = useState<Item[]>([]);
  const [baseItems, setBaseItems] = useState<Item[]>([]);
  const [nearPlayers, setNearPlayers] = useState<Player[]>([]);
  const [PlayerName, setPlayerName] = useState<Name[]>([]);
  const [ContainerID, setContainerID] = useState<ID[]>([]);
  const [showOtherInv, setShowOtherInv] = React.useState(false);
  const numRows = items.length;
  const numRows2 = itemsother.length;
  const [closeQuery] = useNuiQuery("close");
  const [reorderQuery] = useNuiQuery("reorder");
  const [giveQuery] = useNuiQuery("give");

  useNuiEvent(({ data }) => {
    setBaseItems(data.content);
    setItems(data.content);
  }, "updateSelfInventory");

  useNuiEvent(({ data }) => {
    if (showOtherInv) {
      setOtherItems(playerInventoryMock.items);
    } else {
      setOtherItems(data.content);
    }
  }, "updateOtherInventory");

  useNuiEvent(({ data }) => {
    setNearPlayers(data);
  }, "updateNearPlayers");

  useNuiEvent(({ data }) => {
    setPlayerName(data);
  }, "SetPlayerData");

  useNuiEvent(({ data }) => {
    setShowOtherInv(data);
  }, "SetShowOtherInv");

  // Set default mock values if we're on browser
  useEffect(() => {
    if (isBrowser) {
      setBaseItems(playerInventoryMock.items);
      setItems(playerInventoryMock.items);
      setNearPlayers(nearPlayersMock);
    }
  }, [isBrowser]);

  // Close on escape
  useEffect(() => {
    const handleEsc = (event: KeyboardEvent) => {
      if (event.key === "Escape" || "I") {
        // Check is items position has changed
        const hasPositionChanged = hasItemsPositionChanged(baseItems, items);

        if (hasPositionChanged) {
          reorderQuery({ items });
        }

        closeQuery();
      }
    };
    window.addEventListener("keydown", handleEsc);

    return () => {
      window.removeEventListener("keydown", handleEsc);
    };
  }, [items, baseItems, reorderQuery, closeQuery]);

  const moveItem = useCallback(
    (dragIndex: number, hoverIndex: number) => {
      const dragItem = items[dragIndex];
      setItems(
        update(items, {
          $splice: [
            [dragIndex, 1],
            [hoverIndex, 0, dragItem],
          ],
        })
      );
    },
    [items]
  );

  const moveOtherItem = useCallback(
    (dragIndex: number, hoverIndex: number) => {
      const dragItem = itemsother[dragIndex];
      setOtherItems(
        update(itemsother, {
          $splice: [
            [dragIndex, 1],
            [hoverIndex, 0, dragItem],
          ],
        })
      );
    },
    [itemsother]
  );
  
  const onItemDropOnPlayerTarget = useCallback(
    (dragItem: any, player: { distance: number; playerId: string }) => {
      const item = items[dragItem.index];

      setModalMetadata({
        targetPlayer: player,
        itemCount: item.quantity,
        item: item,
        isOpen: true,
      });
    },
    [items]
  );

  return (
    <Container>
      <InventoryContainerAlone style={{width: showOtherInv ? '47%' : '63%' , left: showOtherInv ? '1%' : '15%'}}>
        <Header>  
        <div> 
          {PlayerName} | Inventory 
          {'\n'}
          {'\n'}
         (<text style={{color: '#009ACD'}}> 027278302 </text>)
          </div>
        <Info>
        <div> 
        Capacity:<text style={{color: '#009ACD'}}> {numRows} / 64 </text>
        {'\n'}
        {'\n'}
         Weight:<text style={{color: '#009ACD'}}> {numRows} / 100 </text>
        </div>
          </Info>
        </Header>
        <ItemsContainer>
          <DndProvider
            backend={TouchBackend}
            options={{ enableMouseEvents: true, enableTouchEvents: false }}
          >
            {items.map((item, index) => (
              <Item
                key={item.name}
                item={item}
                index={index}
                moveItem={moveItem}
              />
            ))}
            <ItemPreview items={items} />
          </DndProvider>
        </ItemsContainer>
      </InventoryContainerAlone>
      {/* @TODO: manage source inventory (->/<-) target inventory drag/drop */}
       <InventoryContainer style={{display: showOtherInv ? 'block' : 'none' }}>
       <Header>  
        <div> 
        {'\n'}
          Trunk | Inventory 
          {'\n'}
         (<text style={{color: '#00FFFF'}}> 08464836 </text>)
          </div>
        <Info>
        <div> 
        Capacity:<text style={{color: '#00FFFF'}}> {numRows2} / 72 </text>
        {'\n'}
        {'\n'}
         Weight:<text style={{color: '#00FFFF'}}> {numRows2} / 256 </text>
          </div>
          </Info>
        </Header>
        <ItemsContainer>
          <DndProvider
            backend={TouchBackend}
            options={{ enableMouseEvents: true, enableTouchEvents: false }}
          >
            {itemsother.map((item, index) => (
              <Item
                key={item.name}
                item={item}
                index={index}
                moveItem={moveOtherItem}
                />
            ))}

            <ItemPreview items={itemsother} />
          </DndProvider>
        </ItemsContainer>
      </InventoryContainer> 
      <RangeSelectorModal
        onClose={() => setModalMetadata({ isOpen: false })}
        onConfirm={(selectedItemCount) => {
          const hasPositionChanged = hasItemsPositionChanged(baseItems, items);

          if (hasPositionChanged) {
            reorderQuery({ items });
          }

          giveQuery({
            name: modalMetadata.item?.name,
            quantity: selectedItemCount,
            data: "test",
            playerId: modalMetadata.targetPlayer?.playerId,
          });

          setModalMetadata({ isOpen: false });
        }}
        targetPlayer={modalMetadata?.targetPlayer}
        isOpen={modalMetadata?.isOpen}
        itemCount={modalMetadata?.itemCount || -1}
        item={modalMetadata?.item}
      />
    </Container>
  );
};

export default App;
