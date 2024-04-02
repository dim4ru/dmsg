class Message {
  int messageId;
  int senderId;
  int receiverId;
  DateTime timestamp;

  Message({required this.messageId, required this.senderId, required this.receiverId, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> messageJson) {
    return Message(
      messageId: messageJson['messageId'],
      senderId: messageJson['senderId'],
      receiverId: messageJson['receiverId'],
      timestamp: messageJson['timestamp'],
    );
  }
}

class TextMessage extends Message {
  final String text;

  TextMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.text) : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}

class ImageMessage extends Message {
  final String imageUrl;

  ImageMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.imageUrl) : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}