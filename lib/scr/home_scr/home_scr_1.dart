import 'package:elngar/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';
import '../controller/home_controller.dart';
import '../shareWidget/home_widget.dart';

class HomeScr1 extends StatelessWidget {
  String time = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.notifications_outlined, color: ColorApp.primaryColor),
            Text("مرحبا",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(time,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: ColorApp.greenColor)),
                  Text(SecureStorage.readSecureData(AllStringConst.UserName)??"",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Center(
                child: GestureDetector(onTap: (){
              Get.find<HomeController>()   . getUserLocAndDestBtwenbranchAndUser();
                },
                  child: HomeWidget(
                    titel: 'تسجيل حضور',
                    height: 60,
                    color: ColorApp.greenColor.withOpacity(.5),
                    width: size.width * .9,
                    path: "assets/ch.png",
                  ),
                )),
            Center(
                child: GestureDetector(
                  onTap: () {
                    Get.find<HomeController>().logout();
                  },
                  child: HomeWidget(
                    path: "assets/x.png",
                    titel: 'تسجيل خروج',
                    height: 60,
                    color: ColorApp.redColor.withOpacity(.2),
                    width: size.width * .9,
                  ),
                )),
            Center(
                child: GestureDetector(onTap:(){
                  Get.toNamed("HolidayRequest");
                } ,
                  child: HomeWidget(
                    path: "assets/pu.png",
                    titel: 'انشاء طلب اجازة',
                    height: 60,
                    color: ColorApp.lastItemInHome.withOpacity(.3),
                    width: size.width * .9,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Text('  ملخص شهري  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GetBuilder<HomeController>(builder: (logic) {
              return logic.allHolidayModel==null?Center(child: CircularProgressIndicator(),): Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorApp.greenColor.withOpacity(.2),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text('ايام حضور',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorApp.greenColor))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 20,
                                backgroundColor: ColorApp.whiteColor,
                                percent: .8,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text("0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorApp.greenColor,
                                        fontWeight: FontWeight.bold)),
                                progressColor:
                                ColorApp.greenColor.withOpacity(.5),
                              ),
                            ),
                            Text('ايام',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.greenColor,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorApp.accentColor.withOpacity(.3),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text('ايام اجازات',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorApp.accentColor,
                                    ))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 20,
                                backgroundColor: ColorApp.whiteColor,
                                percent: .4,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(logic.allHolidayModel!.holiday!.length.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorApp.accentColor,
                                        fontWeight: FontWeight.bold)),
                                progressColor:
                                ColorApp.accentColor.withOpacity(.8),
                              ),
                            ),
                            Text('ايام',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.accentColor,
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
