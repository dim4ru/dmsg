import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'message_input_controller.dart';

class MessageInput extends GetView<MessageInputController> {
  final controller = MessageInputController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
          Container(
            margin: EdgeInsets.only(bottom: 1, left: 10, right: 10),
            alignment: Alignment.bottomLeft,
            child: TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: 'New message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (val) {
                controller.newMessage.value = val;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "You can't send empty message";
                }
                return null;
              },
            ),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.send))
        ],
      ),
    );
  }

}