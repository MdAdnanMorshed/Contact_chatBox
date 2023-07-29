import 'package:contact_chat_box/app/core/values/app_space.dart';
import 'package:contact_chat_box/app/models/message_history_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/style_text.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../helpers/app_helper.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<MessageHistoryModel> smsHistory = Get.arguments[0];
   String uiD = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat View'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Get.height - 150,
              child: ListView.builder(
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
            ),
            Container(
              color: Colors.blue.withOpacity(0.1),
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: controller.messageController,
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.grey.withOpacity(0.3), 10),
                      hintText: "Enter Message",
                      style: AppTextStyle.labelSmall,
                    ),
                  ),
                  AppSpace.spaceW8,
                  InkWell(
                      onTap: () {

                        FocusScope.of(context).unfocus();
                        controller.sendMessage(uiD.toString());
                      },
                      child: const Icon(Icons.send)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
