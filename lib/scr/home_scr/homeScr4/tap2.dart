import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_colors.dart';
import '../../controller/home_controller.dart';
import '../../shareWidget/home_widget.dart';

class Tap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
            child:  GestureDetector(onTap:(){
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
        Expanded(child: GetBuilder<HomeController>(builder: (logic) {
          return logic.allHolidayModel == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: logic.allHolidayModel?.holiday?.length,
                  itemBuilder: (cont, pos) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 8,
                          child: Column(
                            children: [
                              item(
                                  val: logic.allHolidayModel!.holiday![pos]
                                      .createdAt!.substring(0,10),
                                  titel: "تاريخ الطلب"),
                              // item(val:  "${logic.allHolidayModel?.holiday![pos].fromDate} / ${logic.allHolidayModel?.holiday![pos].toDate}", titel: "عدد الايام"),
                              item(
                                  val: logic
                                      .allHolidayModel!.holiday![pos].fromDate!,
                                  titel: "تاريخ بداية الاجازه"),
                              item(
                                  val: logic
                                      .allHolidayModel!.holiday![pos].toDate!,
                                  titel: "تاريخ نهاية الاجازة"),
                              item(
                                  val: logic.allHolidayModel?.holiday![pos]
                                              .isApproved ==
1
                                      ? "موافق"
                                      :  logic.allHolidayModel?.holiday![pos]
                                      .isApproved ==2?"رفض": logic.allHolidayModel?.holiday![pos]
                                      .isApproved ==3?"تعديل":"تم الغائها",
                                  titel: "الرد علي طلب الاجازه"),
                            ],
                          )),
                    );
                  });
        }))
      ],
    );
  }

  Widget item({required String titel, required String val}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 4, child: Text(titel)),
            Expanded(flex: 4, child: Text(val))
          ],
        ),
      ),
    );
  }
}
