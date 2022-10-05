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
        appBar: AppBar( centerTitle: true, title: Text("تنبيهات" ), actions: []),
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
                        ), SizedBox(width: 10,),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(
                            logic.allNotificationsModel!.notifications![pos].title!)
                    ,   SizedBox(height: 2,) ,  Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/clock.png",),)),
                              ),SizedBox(width: 8,),
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
