
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dmsg/widgets/messages/message_timestamp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../constants.dart';
import '../../models/message.dart' as model;


abstract class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key, required this.message}) : super(key: key);

  final model.ImageMessage message;
}

class IncomingImageMessage extends ImageMessage {
  const IncomingImageMessage({Key? key, required model.ImageMessage message}) : super(key: key, message: message);

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
              padding: const EdgeInsets.symmetric(horizontal: imageBubbleBorder, vertical: imageBubbleBorder),
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
            child: MessageTimestamp(timestamp: message.timestamp,),
          )
        ],
      ),
    );
  }
}

class OutgoingImageMessage extends ImageMessage {
  const OutgoingImageMessage({Key? key, required model.ImageMessage message}) : super(key: key, message: message);

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
              padding: const EdgeInsets.symmetric(horizontal: imageBubbleBorder, vertical: imageBubbleBorder),
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
          SizedBox(width: messageBubbleChatMargin),
        ],
      ),
    );
  }
}