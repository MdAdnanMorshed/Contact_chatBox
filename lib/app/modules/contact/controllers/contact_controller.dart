import 'package:get/get.dart';

import '../../../repositories/news_repo.dart';

class ContactController extends GetxController {
  //TODO: Implement ContactController
  NewsRepo repo = NewsRepo();
  final count = 0.obs;
  @override
  void onInit() {
     getContactList();
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

  getContactList()async{
   var res = await repo.getContactList();
  }

}
