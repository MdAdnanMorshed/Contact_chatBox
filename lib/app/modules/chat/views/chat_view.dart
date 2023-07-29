import 'package:contact_chat_box/app/models/message_history_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   var userId=Get.arguments;
   controller.userId=userId.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: Obx(() {

        if (controller.isLoadingData.value) {
          if (controller.messageHistory.isEmpty) {
            return const Center(child: Text('No Data '));
          }
          return ListView.builder(
              itemCount: controller.messageHistory.length,
              itemBuilder: (context, int index) {
                MessageHistoryModel data = controller.messageHistory[index];


                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(data.message.toString()),
                    subtitle: Text(data.time.toString()),
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }));

  }
}
