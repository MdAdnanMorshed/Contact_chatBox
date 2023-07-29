import 'package:contact_chat_box/app/models/message_history_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<MessageHistoryModel> smsHistory = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: smsHistory.length,
          itemBuilder: (context, int index) {
            MessageHistoryModel data = smsHistory[index];
            return Card(
              elevation: 2,
              child: ListTile(
                title: Text(data.message.toString()),
                subtitle: Text(data.time.toString()),
              ),
            );
          }),
    );
  }
}
