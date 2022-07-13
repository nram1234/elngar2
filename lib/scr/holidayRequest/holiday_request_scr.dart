import 'package:elngar/scr/controller/holiday_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../rep/json_model/login_model.dart';
import '../../utility/app_colors.dart';
import '../controller/home_controller.dart';
import '../shareWidget/custom_button.dart';

class HolidayRequestScr extends GetView<HolidayRequestController> {
  TextEditingController textfiledname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Expanded(child: Image.asset("assets/sign.png")),
                Expanded(child: Text("طلب اجازة", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40),)),

              ],
            )
            , Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Directionality(textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '', labelText: 'الاسم',
                  ),
                ),
              ),
            ),


            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //   child: Container(width: double.infinity,
            //     decoration: BoxDecoration(border: Border.all()),
            //     child: GetBuilder<HomeController>(
            //         builder: (logic) {
            //           return DropdownButton<Branch>(
            //             value: logic.selectPranch,hint: const Text("اختار الفرع"),
            //             isExpanded: true,
            //             //  icon: const Icon(Icons.arrow_downward),
            //             elevation: 16,
            //             //  style: const TextStyle(color: Colors.deepPurple),
            //             underline: SizedBox(),
            //             alignment: Alignment.centerRight,
            //             onChanged: logic.upDateselectPranch,
            //             items: logic.data!.data!.branch!
            //                 .map<DropdownMenuItem<Branch>>((Branch value) {
            //               return DropdownMenuItem<Branch>(
            //                 value: value,
            //                 child: Text(value.name!),
            //               );
            //             }).toList(),
            //           );
            //         }),
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: InkWell(onTap: () {
                      controller.selectFromDocDate(context: context);
                    },
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(right: 8, left: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                // color: Theme
                                //     .of(context)
                                //     .colorScheme
                                //     .primary

                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(6))),
                          child:
                          TextField(enabled: false,
                            controller: controller
                                .textEditingControllerFromDocDate,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'From',
                            ),
                          )
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        height: 10,
                      )),
                  Expanded(
                    flex: 4,
                    child: InkWell(onTap: () {
                      controller.selectToDocDate(context: context);
                    },
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(right: 8, left: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                //color:

                                // Theme
                                //     .of(context)
                                //     .colorScheme
                                //     .primary


                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(6))),
                          child:
                          TextField(enabled: false,
                            controller: controller
                                .textEditingControllerToDocDate,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'To',
                            ),
                          )
                        //   Center(child: Text(controller.toDocDate))
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Directionality(textDirection: TextDirection.rtl,
                child: TextField(maxLines: 6,
                  controller: controller.textEditingControllerreason,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '', labelText: 'سبب الاجازة',
                  ),
                ),
              ),
            ),


            GetBuilder<HolidayRequestController>(
                builder: (logic) {
                  return logic.sendData?Center(child: const CircularProgressIndicator(),): CustomButton(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .7,
                    buttonColor: ColorApp.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    title: 'ارسل الطلب',
                    height: 50,
                    onClick: () {
                      controller.postHoliday();
                    },);
                })
          ]),
        ),
      ),
    );
  }
}
