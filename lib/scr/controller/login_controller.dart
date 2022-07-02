


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../rep/api/login_api.dart';
import '../../rep/json_model/login_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';
import '../../utility/utilitie.dart';

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


  logIng()async{
    Position? currentUserLoc=await getLoction( );
  if(formKey.currentState!.validate()){
    islogin=true;
    update();
    LogInAPI logInAPI=LogInAPI();
    Map <String,dynamic>a={};
    a['job_num']  =username.text;
    a['password']  =password.text;
    a['language']  = 'ar';
//  a['lat']  = currentUserLoc.longitude;
  //a['long']  =currentUserLoc.latitude;
    AndroidDeviceInfo info=await _getId();

 a['device_id']=info.id.toString();

    logInAPI.post(a).then((value) async{

      LogInModel data=value as LogInModel;
      print(data.status);
      print(a);
      if(data.status==true){
        await SecureStorage.writeSecureJsonData(
            key:AllStringConst.login ,value: data.toJson());
        SecureStorage.writeSecureData(key: AllStringConst.Token,value: data.data!.user!.token!);

        SecureStorage.writeSecureData(key: AllStringConst.jobNum,value: data.data!.user!.jobNum.toString());

        SecureStorage.writeSecureData(key: AllStringConst.UserName,value: data.data!.user!.name!);


        Get.toNamed("Home");
      }else{
        Get.snackbar("", data.msg!);
      }
      islogin=false;
update();

    });

  }
  }


  @override
  void onInit() {
    super.onInit();
    _getId();
  }

  Future<AndroidDeviceInfo> _getId() async {
    //var deviceInfo = DeviceInfoPlugin();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

// Android
    AndroidDeviceInfo info = await deviceInfo.androidInfo;

    print(info.id);
    print(info.board);
    print(info.bootloader);
    print(info.brand);
    print(info.device);
    print(info.androidId);
    return info;
    // if (Platform.isIOS) { // import 'dart:io'
    //   var iosDeviceInfo = await deviceInfo.iosInfo;
    //   return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    // } else if(Platform.isAndroid) {
    //   var androidDeviceInfo = await deviceInfo.androidInfo;
    //   print("androidDeviceInfo.androidId  => ${androidDeviceInfo.androidId}");
    //   return androidDeviceInfo.androidId; // unique ID on Android
    // }
  }
}