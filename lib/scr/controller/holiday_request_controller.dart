import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../rep/api/post_holiday_api.dart';
import '../../rep/json_model/holiday_post_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';

class HolidayRequestController extends GetxController{
bool sendData=false;
  PostHolidayApi _postHolidayApi=PostHolidayApi();

  TextEditingController textEditingControllerFromDocDate = TextEditingController();
  TextEditingController textEditingControllerToDocDate = TextEditingController();

  TextEditingController textEditingControllerreason = TextEditingController();






  postHoliday(){
    sendData=true;
    update();
Map<String,dynamic>data={};
data["branch_id"]=12;
data["from_date"]=textEditingControllerFromDocDate.text;
data["to_date"]=textEditingControllerToDocDate.text;
data["reason"]=textEditingControllerreason.text;
data["is_approved"]=1;
data["language"]="ar";
data["token"]= SecureStorage.readSecureData(AllStringConst.Token)!;

print(data);



    _postHolidayApi.post(data).then((value) {


      HolidayPostModel data=value as HolidayPostModel;
print(data.toJson());

      sendData=false;
      update();
Get.back();
    });



  }






  Future<void> selectFromDocDate({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (pickedDate != null) {
      textEditingControllerFromDocDate.text = pickedDate.toString().substring(0, 10);

      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(pickedDate);

      update();
    }
  }

  Future<void> selectToDocDate({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (pickedDate != null) {
      textEditingControllerToDocDate.text = pickedDate.toString().substring(0, 10);
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(pickedDate);

      update();
    }
  }



}