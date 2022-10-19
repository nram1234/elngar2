


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../push_notifcation.dart';
import '../../rep/api/login_api.dart';
import '../../rep/json_model/login_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';
import '../../utility/utilitie.dart';

class LogingController extends GetxController{
  final formKey = GlobalKey<FormState>();
TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();
bool isSc=true;

updateisSc(bool v){
  isSc=v;
  update();
}
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
     PushNotificationManagger().init().then((value)async {

    print("this is thefirebase_tokenfirebase_token =>${value} ");
    if(formKey.currentState!.validate()){
      islogin=true;
      update();
      LogInAPI logInAPI=LogInAPI();
      Map <String,dynamic>a={};
      a['job_num']  =username.text;
      a['password']  =password.text;
      a['language']  = 'ar';
      a['firebase_token']  = value;
      //   a['lat']  = currentUserLoc?.longitude;
      // a['long']  =currentUserLoc?.latitude;
      AndroidDeviceInfo info=await _getId();

      a['device_id']=info.id.toString();
      print("this aaa=>$a");
      logInAPI.post(a).then((value) async{
        print(value);
        LogInModel data=value as LogInModel;
        // print( "this is tokenn =>${data.user?.token}");
        print(data.status==true);
        print(data.status);
        if(data.status==true){
//print("000000000000000000000000000000000000000000000");
//print( "this is tokenn =>${data.toJson()}");
          await SecureStorage.writeSecureData(key: AllStringConst.Token,value: data.user!.token!);

          await SecureStorage.writeSecureData(key: AllStringConst.jobNum,value: data.user!.jobNum.toString());

          await SecureStorage.writeSecureData(key: AllStringConst.UserName,value: data.user!.name!);
          await SecureStorage.writeSecureDataINT(key: AllStringConst.type,value: data.user!.type!);
          await SecureStorage.writeSecureJsonData(
              key:AllStringConst.login ,value: data.toJson());
          Get.offAllNamed("Home");
        }else{

          Get.snackbar("", data.msg!);
        }
        islogin=false;
        update();

      }) ;

    }
  });

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