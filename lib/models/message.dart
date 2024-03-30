class Message {
  final int messageId;
  final int senderId;
  final int receiverId;
  final DateTime timestamp;

  Message(this.messageId, this.senderId, this.receiverId, this.timestamp);
}

class TextMessage extends Message {
  final String text;

  TextMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.text) : super(messageId, senderId, receiverId, timestamp);
}

class ImageMessage extends Message {
  final String imageUrl;

  ImageMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.imageUrl) : super(messageId, senderId, receiverId, timestamp);
}