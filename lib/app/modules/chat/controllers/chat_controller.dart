import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/message_history_model.dart';
import '../../../repositories/news_repo.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController
  TextEditingController messageController=TextEditingController();

  final count = 0.obs;

  final  uerId=''.obs;

  NewsRepo repo = NewsRepo();
  List<MessageHistoryModel> messageHistory=[];
  final isLoadingData = false.obs;

  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 Future<List<MessageHistoryModel>> getMessageList(String userId)async{
    uerId.value=userId;
    var res = await repo.getMessageHistoryList(userId);
    var result=jsonDecode(res.body);
    for(var data in result['data']){
      messageHistory.add(MessageHistoryModel.fromJson(data));
    }
    isLoadingData.value=true;
    print('ContactController.getContactList Lng: ${messageHistory.length}');
    print('name : ${messageHistory[0].time}');
    return messageHistory;
  }

  sendMessage(String uId)async{
    print('messageController ${messageController.text}');

    if(messageController.text==''){
      Get.snackbar('Alert', 'Please Enter your message...');
    }else{
      Get.snackbar('Successful!', ' message has sent ${uerId.toString()}');
       await repo.sendMessage(uId, messageController.text.toString());
      getMessageList(uId.toString());
    }

  }

}
