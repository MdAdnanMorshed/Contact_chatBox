import 'dart:convert';

import 'package:get/get.dart';

import '../../../models/contact_model.dart';
import '../../../repositories/news_repo.dart';

class ContactController extends GetxController {
  //TODO: Implement ContactController
  NewsRepo repo = NewsRepo();
  List<ContactModel> contactList=[];
  final isLoadingData = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     getContactList();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
  getContactList()async{
   var res = await repo.getContactList();
   var result=jsonDecode(res.body);
   //ContactModel
    for(var data in result['data']){
      contactList.add(ContactModel.fromJson(data));
    }
   isLoadingData.value=true;
   print('ContactController.getContactList Lng: ${contactList.length}');
   print('name : ${contactList[0].name}');
  }

}
