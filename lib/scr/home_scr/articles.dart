import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';

class Aticles extends StatelessWidget {
  const Aticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        centerTitle: true,
        title: Text("مقالات"),
        actions: [     GestureDetector(onTap: (){
          Get.find<NotificationController>().getAllAotifications();
          Get.toNamed("NotificationSCR");
        },child: Icon(Icons.notifications_outlined, color: ColorApp.whiteColor)),]),body: GetBuilder<HomeController>(builder: (logic) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${logic.homeModel?.home?.articles}"),
      );
    }),);
  }
}
