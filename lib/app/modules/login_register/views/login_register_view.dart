

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/style_text.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_space.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../helpers/app_helper.dart';
import '../controllers/login_register_controller.dart';

class LoginRegisterView extends GetView<LoginRegisterView> {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(backgroundColor: AppColors.white, body: _buildBody(context)),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<LoginRegisterController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.PNG',
                    width: 200,
                    height: 200,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.mailOrPhoneController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Enter Email or Phone",
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.passwordController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Enter Password",
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH26,
                  InkWell(
                    onTap: () {
                      print('LoginRegisterView._buildBody');

                      _.userLogin();

                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Log In  ',
                        style: AppTextStyle.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

