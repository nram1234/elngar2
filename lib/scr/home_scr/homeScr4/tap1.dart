import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class Tap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (logic) {
      return logic.userProfileModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.only(right:8,left: 8),
                      width: size.width,
                      height: 50,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                              "  ${logic.userProfileModel!.userProfile!.name}  "),
                          Text(
                              ": الاسم "),   ],
                      ),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.only(right:8,left: 8),
                      width: size.width,
                      height: 50,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                              "  ${logic.userProfileModel!.userProfile!.jobNum} "),
                          Text(
                              " :  رقم الوظيفة"),  ],
                      ),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.only(right:8,left: 8),
                      width: size.width,
                      height: 50,
                      child: Row(  mainAxisAlignment: MainAxisAlignment.end,
      children: [

                          Text(
                              "  ${logic.userProfileModel!.userProfile!.type}"),
        Text(
            " :  نوع الوظيفة"), ],
                      ),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.only(right:8,left: 8),
                      width: size.width,
                      height: 50,
                      child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                              "  ${logic.userProfileModel!.userProfile!.payroll}"),
                          Text(
                              " :  المرتب"), ],
                      ),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.only(right:8,left: 8),
                      width: size.width,
                      height: 50,
                      child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                              "  ${logic.userProfileModel!.userProfile!.startWorkDate}"),
                          Text(
                              " :  تاريخ البداء"), ],
                      ),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10))),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       hintText: "الاسم",
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       hintText: "رقم الموظف",
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       hintText: "رقم الجوال",
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //
                //     decoration: InputDecoration(
                //       hintText: "كلمة السر",
                //       errorBorder:
                //       OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                //       focusedBorder:
                //       OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                //       enabledBorder:
                //       OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                //     ),
                //   ),
                // ),
              ],
            );
    });
  }
}
