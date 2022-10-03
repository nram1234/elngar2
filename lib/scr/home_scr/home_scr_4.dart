import 'package:elngar/utility/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';
import 'homeScr4/tap1.dart';
import 'homeScr4/tap2.dart';

class HomeScr4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("الملف الشخصي"),
            actions: [     GestureDetector(onTap: (){
              Get.find<NotificationController>().getAllAotifications();
              Get.toNamed("NotificationSCR");
            },child: Icon(Icons.notifications_outlined, color: ColorApp.whiteColor)),]),
        body: GetBuilder<HomeController>(builder: (logic) {
          return Container( width: size.width,
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(.1)),
                    width: size.width * .9,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [     Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  logic.setindexINProfile(1);
                                },
                                child: Container(
                                  child: Center(child: Text("طلبات سابقة")),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: logic.indexINProfile == 1
                                          ? ColorApp.lightB.withOpacity(.5)
                                          : Colors.white.withOpacity(.1)),
                                ))),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                logic.setindexINProfile(0);
                              },
                              child: Container(
                                  child: Center(child: Text("بيانات شخصية")),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: logic.indexINProfile == 0
                                        ? ColorApp.lightB.withOpacity(.5)
                                        : Colors.white.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),

                        ]),
                  ),
                ),
           logic.indexINProfile==0?  Tap1(): Expanded(child: Tap2())],
            ),
          );
        }));
  }




}
