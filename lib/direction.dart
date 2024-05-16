import 'models/message.dart';

enum Direction { outgoing, incoming }

Direction getDirection(Message message, String currentUserUID) {
  if (message.senderId == currentUserUID) {
    return Direction.outgoing;
  }
  return Direction.incoming;
}