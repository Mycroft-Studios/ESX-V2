import React, { FunctionComponent, useEffect, useState } from "react";
import { Form, Modal, Button, Icon, Header } from "semantic-ui-react";

type ReasonModalProps = {
  action?: string;
  playerId?: string;
  isOpened: boolean;
  onConfirm: (reason: string) => void;
  onClose: () => void;
};

export const ReasonModal: FunctionComponent<ReasonModalProps> = ({
  action,
  playerId,
  isOpened,
  onConfirm,
  onClose,
}) => {
  const [reason, setReason] = useState("");

  useEffect(() => {
    setReason("");
  }, [isOpened]);

  return (
    <Modal
      closeOnDimmerClick={false}
      closeIcon
      open={isOpened}
      onClose={onClose}
    >
      <Header icon="trash" content={`${action?.toUpperCase()} ${playerId}`} />
      <Modal.Content>
        <p>
          You're about to {action} Player({playerId}), please enter a reason.
        </p>
        <Form>
          <Form.TextArea
            error={!reason ? "Enter a reason" : null}
            onChange={(_, { value }) => setReason(String(value))}
            label="Reason"
            placeholder="Player Broke the Rules - Mycroft Studios"
          />
        </Form>
      </Modal.Content>
      <Modal.Actions>
        <Button primary disabled={!reason} onClick={() => onConfirm(reason)}>
          <Icon name="trash" /> {action?.toUpperCase()}
        </Button>
      </Modal.Actions>
    </Modal>
  );
};
