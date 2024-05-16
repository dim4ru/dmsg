import 'models/message.dart';

enum Direction { outcoming, incoming }

Direction getDirection(Message message, String currentUserUID) {
  if (message.senderId == currentUserUID) {
    return Direction.outcoming;
  }
  return Direction.incoming;
}