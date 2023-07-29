import 'package:get/get.dart';

import '../controllers/message_history_controller.dart';

class MessageHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageHistoryController>(
      () => MessageHistoryController(),
    );
  }
}
