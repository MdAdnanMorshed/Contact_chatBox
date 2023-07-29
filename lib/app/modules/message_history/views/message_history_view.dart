import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_history_controller.dart';

class MessageHistoryView extends GetView<MessageHistoryController> {
  const MessageHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessageHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessageHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
