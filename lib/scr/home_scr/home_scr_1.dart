import 'package:elngar/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';
import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';
import '../shareWidget/home_widget.dart';

class HomeScr1 extends StatelessWidget {
  String time = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    var naaa=SecureStorage.readSecureData(AllStringConst.UserName);
    print("  SecureStorage.readSecureData(AllStringConst.UserName) $naaa");
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
            GestureDetector(
                onTap: () {
                  Get.find<NotificationController>().getAllAotifications();
                  Get.toNamed("NotificationSCR");
                },
                child: Icon(Icons.notifications_outlined,
                    color: ColorApp.primaryColor)),
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
                  Text(
                      SecureStorage.readSecureData(AllStringConst.UserName) ??
                          "",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            GetBuilder<HomeController>(builder: (logic) {
              return Center(
                  child: logic.getAttendance
                      ? SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator())
                      : GestureDetector(
                    onTap: () {
                      // if (SecureStorage.readSecureDataINT(AllStringConst.type) ==
                      //     4 || SecureStorage.readSecureDataINT(AllStringConst
                      //     .type) == 2) {
                      //   logic.getUserAttendanceWithOutLoction();
                      // } else {
                      Get.find<HomeController>()
                          .getUserLocAndDestBtwenbranchAndUser();
                      // }
                    },
                    child: HomeWidget(
                      titel: 'تسجيل حضور',
                      height: 60,
                      color: ColorApp.greenColor.withOpacity(.5),
                      width: size.width * .9,
                      path: "assets/ch.png",
                    ),
                  ));
            }),
            Center(child: GetBuilder<HomeController>(builder: (logic) {
              return logic.ischechout
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : GestureDetector(
                onTap: () {
                  Get.find<HomeController>().chechout();
                },
                child: HomeWidget(
                  path: "assets/x.png",
                  titel: 'تسجيل مغادرة',
                  height: 60,
                  color: ColorApp.greenColor.withOpacity(.2),
                  width: size.width * .9,
                ),
              );
            })),
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
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("HolidayRequest");
                  },
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
            GetBuilder<HomeController>( builder: (logic) {
              return logic.homeModel == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Row(
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
                                percent:
                                (logic.homeModel?.home?.attendance??0) /
                                    30,
                                animation: true,
                                circularStrokeCap:
                                CircularStrokeCap.round,
                                center: Text(
                                    logic.homeModel?.home?.attendance
                                        ?.toString()??"",
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
                                percent:
                               ( logic.homeModel?.home?.absence??0) / 30,
                                animation: true,
                                circularStrokeCap:
                                CircularStrokeCap.round,
                                center: Text(
                                    logic.homeModel?.home?.absence
                                        ?.toString()??"",
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
            }),
            // Divider(height: 1, thickness: 1,),
            // Container(height: 40,
            //   child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //           child: Center(
            //               child: Text(
            //                 "الحالة" ,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16),
            //               ))),
            //       Container(
            //         height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //       Expanded(
            //           child: Center(
            //               child: Text(
            //                 "الشهر",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16),
            //               ))),
            //       Container(
            //         height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //       Expanded(
            //           child: Center(
            //               child: Text(
            //                 "ايام الحضور"   ,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16),
            //               ))),
            //       Container(
            //         height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //       Expanded(
            //           child: Center(
            //               child: Text(
            //                 "الراتب",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16),
            //               ))),
            //     ],
            //   ),
            // )
            // , Divider(height: 1, thickness: 1,),
            // GetBuilder<HomeController>(builder: (logic) {
            //   return
            //   logic.salariesModel == null
            //       ? Center(
            //     child: CircularProgressIndicator(),
            //   ):
            //   Container(height: 300,
            //     child: ListView.builder(
            //       itemCount: logic.salariesModel?.notifications?.length, itemBuilder: (context, pos) {
            //       return     Container(height: 40,
            //         child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Expanded(
            //                 child: Center(
            //                     child: Text(
            //                       logic.salariesModel?.notifications?[pos].status??"" ,
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold, fontSize: 16),
            //                     ))),
            //             Container(
            //               height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //             Expanded(
            //                 child: Center(
            //                     child: Text(
            //                       logic.salariesModel?.notifications?[pos].date??"",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold, fontSize: 16),
            //                     ))),
            //             Container(
            //               height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //             Expanded(
            //                 child: Center(
            //                     child: Text(
            //                       logic.salariesModel?.notifications?[pos].daies??""  ,
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold, fontSize: 16),
            //                     ))),
            //             Container(
            //               height: 40, width: 1, color: Colors.grey.withOpacity(.5),),
            //             Expanded(
            //                 child: Center(
            //                     child: Text(
            //                       logic.salariesModel?.notifications?[pos].sallerValue??"",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold, fontSize: 16),
            //                     ))),
            //           ],
            //         ),
            //       );
            //     }),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}
