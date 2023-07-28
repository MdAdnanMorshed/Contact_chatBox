import 'dart:convert';

import 'package:contact_chat_box/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../repositories/news_repo.dart';

class LoginRegisterController extends GetxController {
  var mailOrPhoneController = TextEditingController();
  var passwordController = TextEditingController();

  NewsRepo repo = NewsRepo();

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

  createUserAccount() async {}

  userLogin() async {
    var res = await repo.signInAuth(
        mailOrPhoneController.text, passwordController.text);
    var result = jsonDecode(res.body);
    print('LoginRegisterController.userLogin >> $result');
    print(
        'LoginRegisterController.userLogin token >> ${result['data']['token']}');
      print(  'LoginRegisterController.userLogin token >> ${result['data']['user']['name']}');
    var token =result['data']['token'];

    print('LoginRegisterController.userLogin token <><> $token');

    await prefs.setString('Token', token);

    await prefs.getString('Token');


    Get.toNamed(Routes.CONTACT);
  }
}
