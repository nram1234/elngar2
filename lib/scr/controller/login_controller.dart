


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../rep/api/login_api.dart';
import '../../rep/json_model/login_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';

class LogingController extends GetxController{
  final formKey = GlobalKey<FormState>();
TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();

bool islogin=false;
String? nameValidator  (value) {
  if (value == null || value.isEmpty) {
  return 'ادخل اسم الموظف';
  }
  return null;
  }
  String? passwordValidator  (value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة السر';
    }
    return null;
  }


  logIng(){
  if(formKey.currentState!.validate()){
    islogin=true;
    update();
    LogInAPI logInAPI=LogInAPI();
    Map <String,dynamic>a={};
    a['job_num']  =username.text;
    a['password']  =password.text;
    a['language']  = 'ar';
    logInAPI.post(a).then((value) {

      LogInModel data=value as LogInModel;
      print(data.status);
      if(data.status==true){

        SecureStorage.writeSecureData(key: AllStringConst.Token,value: data.user!.token!);

        Get.toNamed("Home");
      }else{
        Get.snackbar("", data.msg!);
      }
      islogin=false;
update();

    });

  }
  }
}