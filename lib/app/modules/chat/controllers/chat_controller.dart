import 'dart:convert';

import 'package:get/get.dart';

import '../../../models/message_history_model.dart';
import '../../../repositories/news_repo.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController

  final count = 0.obs;
  String userId = '123';
  NewsRepo repo = NewsRepo();
  List<MessageHistoryModel> messageHistory=[];
  final isLoadingData = false.obs;


  @override
  void onInit() {
    super.onInit();
    getMessageList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  getMessageList()async{
    print('userId >>>><><>$userId');
    var res = await repo.getMessageHistoryList(userId);
    var result=jsonDecode(res.body);
    for(var data in result['data']){
      messageHistory.add(MessageHistoryModel.fromJson(data));
    }
    isLoadingData.value=true;
    print('ContactController.getContactList Lng: ${messageHistory.length}');
    print('name : ${messageHistory[0].time}');
  }
}
