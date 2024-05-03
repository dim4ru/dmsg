import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/message.dart' as model;

import '../constants.dart';

abstract class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);

  final model.TextMessage message;
}

class IncomingMessage extends Message {
  const IncomingMessage({Key? key, required model.TextMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          // onLongPress: () => messageController.deleteMessage(message.id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
          child: Text(dateTimeToTimeString(message.timestamp), style: TextStyle(fontSize: 10),),
        )
      ],
    );
  }
}

class OutcomingMessage extends Message {
  const OutcomingMessage({Key? key, required model.TextMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          // onLongPress: () => messageController.deleteMessage(message.id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(dateTimeToTimeString(message.timestamp), style: TextStyle(fontSize: 10),),
        )
      ],
    );
  }
}

String dateTimeToTimeString(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}