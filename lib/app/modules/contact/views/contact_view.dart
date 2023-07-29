import 'package:contact_chat_box/app/models/contact_model.dart';
import 'package:contact_chat_box/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ContactView'),
          centerTitle: true,
        ),
        body:
        Obx(() {
          if (controller.isLoadingData.value) {
            if (controller.contactList.isEmpty) {
              return const Center(child: Text('No Data '));
            }
            return ListView.builder(
                itemCount: controller.contactList.length,
                itemBuilder: (context, int index) {
                  ContactModel data = controller.contactList[index];
                  var image='http://svkraft.shop/${data.image}';
                  print('image <><><> :$image');

                  return InkWell(
                    onTap: (){

                      Get.toNamed(Routes.MESSAGE_HISTORY,arguments: data.userId);
                    },
                    child: Card(

                      elevation: 2,
                      child: ListTile(
                        title: Text(data.name.toString()),
                        subtitle: Text(data.lastMessage.toString()),
                        leading: Image.network(image),
                        trailing: InkWell(
                             onTap: (){
                               Get.toNamed(Routes.CHAT);
                             },
                            child: Icon(Icons.message)),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
