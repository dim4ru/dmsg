import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../helpers.dart';

class MessageTimestamp extends StatelessWidget {
  final DateTime timestamp;

  MessageTimestamp({required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: dateTimeToTimeLongString(timestamp),
        decoration: BoxDecoration(
            color: timestampTooltipBackground,
            borderRadius: BorderRadius.circular(5),
        ),
        child: Text(dateTimeToTimeString(timestamp), style: TextStyle(fontSize: 10),)
    );
  }
}