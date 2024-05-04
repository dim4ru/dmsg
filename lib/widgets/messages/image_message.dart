
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';

import '../../models/message.dart' as model;

import '../constants.dart';

abstract class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key, required this.message}) : super(key: key);

  final model.ImageMessage message;
}

class IncomingImageMessage extends ImageMessage {
  const IncomingImageMessage({Key? key, required model.ImageMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          // onLongPress: () => messageController.deleteMessage(message.id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(messageBubbleRadius),
                bottomLeft: Radius.circular(messageBubbleRadius),
                bottomRight: Radius.circular(messageBubbleRadius),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(messageImageRadius),
              child: OctoImage(
                image: CachedNetworkImageProvider(message.imageUrl),
                placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
                errorBuilder: OctoError.icon(color: Colors.black),
                width: MediaQuery.sizeOf(context).width * messageImageWidth,
                height: (MediaQuery.sizeOf(context).width * messageImageWidth) * messageImageAspectRatio,
                fit: BoxFit.cover,
              ),
            ),
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

class OutcomingImageMessage extends ImageMessage {
  const OutcomingImageMessage({Key? key, required model.ImageMessage message}) : super(key: key, message: message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(dateTimeToTimeString(message.timestamp), style: TextStyle(fontSize: 10),),
        ),
        GestureDetector(
          // onLongPress: () => messageController.deleteMessage(message.id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(messageBubbleRadius),
                bottomLeft: Radius.circular(messageBubbleRadius),
                bottomRight: Radius.circular(messageBubbleRadius),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(messageImageRadius),
              child: OctoImage(
                image: CachedNetworkImageProvider(message.imageUrl),
                placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
                errorBuilder: OctoError.icon(color: Colors.black),
                width: MediaQuery.sizeOf(context).width * messageImageWidth,
                height: (MediaQuery.sizeOf(context).width * messageImageWidth) * messageImageAspectRatio,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String dateTimeToTimeString(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}