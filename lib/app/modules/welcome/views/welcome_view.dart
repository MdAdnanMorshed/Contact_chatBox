import 'package:contact_chat_box/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body:  Center(
        child: ElevatedButton(onPressed: (){

          Get.toNamed(Routes.LOGIN_REGISTER);

        }, child: const Text('Chat  Box ')),
      ),
    );
  }
}
