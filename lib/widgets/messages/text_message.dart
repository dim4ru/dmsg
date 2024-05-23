import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/message.dart' as model;

import '../../constants.dart';
import 'message_timestamp.dart';

abstract class TextMessage extends StatelessWidget {
  const TextMessage({Key? key, required this.message}) : super(key: key);

  final model.TextMessage message;
}

class IncomingTextMessage extends TextMessage {
  const IncomingTextMessage({Key? key, required model.TextMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: messageInterBubblePadding),
      child: Row(
        children: [
          SizedBox(width: messageBubbleChatMargin),
          GestureDetector(
            // onLongPress: () => messageController.deleteMessage(message.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * textBubbleMaxWidthMaxWidth),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(messageBubbleRadius),
                  bottomLeft: Radius.circular(messageBubbleRadius),
                  bottomRight: Radius.circular(messageBubbleRadius),
                ),
              ),
              child: Text(message.text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: MessageTimestamp(timestamp: message.timestamp,),
          )
        ],
      ),
    );
  }
}

class OutgoingTextMessage extends TextMessage {
  const OutgoingTextMessage({Key? key, required model.TextMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: messageInterBubblePadding),
      child: Row(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: MessageTimestamp(timestamp: message.timestamp,),
          ),
          GestureDetector(
            // onLongPress: () => messageController.deleteMessage(message.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * textBubbleMaxWidthMaxWidth),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(messageBubbleRadius),
                  bottomLeft: Radius.circular(messageBubbleRadius),
                  bottomRight: Radius.circular(messageBubbleRadius),
                ),
              ),
              child: Text(message.text),
            ),
          ),
          SizedBox(width: messageBubbleChatMargin),
        ],
      ),
    );
  }
}