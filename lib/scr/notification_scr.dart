import 'package:elngar/utility/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/notification_controller.dart';

class NotificationSCR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("تنبيهات"), actions: []),
        body: GetBuilder<NotificationController>(builder: (logic) {
          return logic.allNotificationsModel == null ? Center(
            child: CircularProgressIndicator(),) : ListView.builder(
              itemCount: logic.allNotificationsModel?.notifications?.length,
              itemBuilder: (context, pos) {
                return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/aler.png"))),
                        ), Expanded(child: Column(children: [Text(
                            logic.allNotificationsModel!.notifications![pos].title!)
                        ,  Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/aler.png"))),
                              ),
                            Text(
                                logic.allNotificationsModel!.notifications![pos].body!)  ],
                        ),
                        ],))
                      ],
                    ));
              });
        }));
  }
}
