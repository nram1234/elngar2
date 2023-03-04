import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart' as di;
import '../../rep/api/all_audios_api.dart';
import '../../rep/api/all_holiday_api.dart';
import '../../rep/api/all_videos_api.dart';
import '../../rep/api/attendance_api.dart';
import '../../rep/api/branchs_api.dart';
import '../../rep/api/chechout_api.dart';
import '../../rep/api/home_api.dart';
import '../../rep/api/logout_api.dart';
import '../../rep/api/upload_video_api.dart';
import '../../rep/api/user_profile_api.dart';
import '../../rep/json_model/all_audios_model.dart';
import '../../rep/json_model/all_holiday_model.dart';
import '../../rep/json_model/all_videos_model.dart';
import '../../rep/json_model/attendance_model.dart';
import '../../rep/json_model/branchs_model.dart';
import '../../rep/json_model/chechout_model.dart';
import '../../rep/json_model/home_model.dart';
import '../../rep/json_model/login_model.dart';
import '../../rep/json_model/login_model.dart';
import '../../rep/json_model/user_profile_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';
import '../../utility/utilitie.dart';
import '../home_scr/home_scr_1.dart';
import '../home_scr/home_scr_2.dart';
import '../home_scr/home_scr_3.dart';
import '../home_scr/home_scr_4.dart';

class HomeController extends GetxController{

  LogOutAPI _logOutAPI=LogOutAPI();
  AllHolidayAPI _allHolidayAPI=AllHolidayAPI();
  AllAudiosAPI _allAudiosAPI=AllAudiosAPI();
  AllVideosAPI _allVideosAPI=AllVideosAPI();
  UploadVideoAPI _uploadVideoAPI=UploadVideoAPI();
  UserProfileAPI _userProfileAPI=UserProfileAPI();
  AttendanceAPI _attendanceAPI=AttendanceAPI();
  BranchsAPI _branchsAPI=BranchsAPI();
  HomeAPI _homeAPI=HomeAPI();
  HomeModel? homeModel;
  BranchsModel? branchsModel;
  Branches? branches;
  AttendanceModel?attendanceModel;
  UserProfileModel? userProfileModel;
  AllHolidayModel? allHolidayModel;
  AllAudiosModel? allAudiosModel;
  AllVideosModel? allVideosModel;
  int indexINProfile=0;
List<VideoPlayerController>listOfVideoPlayerController=[];
  int index=0;
  List<Widget>screens=[HomeScr1(),HomeScr2(),HomeScr3(),HomeScr4()];
Widget? screen;
  Map <String,dynamic>?_logindata;

  LogInModel? data;



bool getAttendance=false;

  // Branch? selectPranch;
  // upDateselectPranch(Branch? branch){
  //   selectPranch=branch;
  //   update();
  // }







getHome(){
  _homeAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}";
  _homeAPI.getData().then((value) {
    homeModel =value as HomeModel;
    print("thissssssssssssssssssssss${homeModel!.home!.branchId}");
    SecureStorage.writeSecureData(key: AllStringConst.branch_id, value: homeModel!.home!.branchId!.toString());
update();

  });

}



getUserProfile()async{
  String token=SecureStorage.readSecureData(AllStringConst.Token)!;
  _userProfileAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}&language=ar";


    _userProfileAPI.getData().then((value) {
      userProfileModel =value as UserProfileModel;
     // print(userProfileModel?.toJson());
    });
}

setindexINProfile(int i){
  indexINProfile=i;
  update();
}
  @override
  void onInit() {
    super.onInit();
    _logindata  =   SecureStorage.readSecureJsonData(  AllStringConst.login )    ;
      data=LogInModel.fromJson(_logindata!);
     // print(data?.toJson());
    _getId();
    screen=screens[index];
   // getdestance();
    getPositionAsStream();
    getAllHoliday();
    getBranchs();
    getHome();
    getAllAudios();
    getAllVideos();
    getUserProfile();
  }

    myScr(int index){
    this.index=index;
    screen=screens[index];
    update();
  }

logout()async{





 String token=await SecureStorage.readSecureData(AllStringConst.Token)!;
  _logOutAPI.post({"token":token,"language":"ar"}).then((value) {
    SecureStorage.deleteSecureData(AllStringConst.Token);
//print(value);
    Get.offAllNamed("Login");
  });
}
getAllHoliday(){
  _allHolidayAPI.data="?token=${SecureStorage.readSecureData(AllStringConst.Token)}";
  // print(_allHolidayAPI.data);
  _allHolidayAPI.getData( ).then((value) {

    allHolidayModel=value as AllHolidayModel;
   update();
  });
}
getAllAudios(){
  _allAudiosAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}&language=ar";
  _allAudiosAPI.getData().then((value) {
    allAudiosModel =value as AllAudiosModel ;

    update();
  });
}


playAudio(String url)async{
  final player = AudioPlayer();                   // Create a player
  final duration = await player.setUrl(           // Load a URL
     url);
  player.play();
}

  getAllVideos(){
    listOfVideoPlayerController.clear();
  _allVideosAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}&language=ar";
  _allVideosAPI.getData().then((value) {
    print("value===>  $value");
    allVideosModel =value as AllVideosModel ;
    allVideosModel?.media?.forEach((element)  {
      VideoPlayerController videoPlayerController=VideoPlayerController.network(
          element.media!)
        ..initialize();

      listOfVideoPlayerController.add(videoPlayerController);
    });
    //print(allVideosModel?.toJson());
    update();
  });
  }



  Future<String?> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

// Android
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    print("info.version  => ${info.id}");
    print("info.version  => ${info.version}");
    print("info.board => ${info.board}");
    print("info.bootloader => ${info.bootloader}");
    print("info.brand => ${info.brand}");
    print("info.device => ${info.device}");
  }
  
  
  
  
  
  
  uploadideo(File file)async{
  print("upload");
    var request = http.MultipartRequest('POST', Uri.parse('https://decorewood-eg.com/api/uploadVideo'));
    request.fields.addAll({
      'language': 'ar',
      'token':  SecureStorage.readSecureData(AllStringConst.Token)!
    });
    request.files.add(await http.MultipartFile.fromPath('media', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("oooooooooooooooooooooooooooooooooooooooooooooo");
      getAllVideos();
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }


  uploadAudio(File file)async{
    print("upload ddddddd");
    var request = http.MultipartRequest('POST', Uri.parse('https://decorewood-eg.com/api/uploadAudio'));
    request.fields.addAll({
      'language': 'en',
      'token':   SecureStorage.readSecureData(AllStringConst.Token)!
    });
    request.files.add(await http.MultipartFile.fromPath('media', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   // print(await response.stream.bytesToString());
    getAllAudios();
    print("upload ddddddd");
    }
    else {
    print(response.reasonPhrase);
    }

  }

getUserAttendanceWithOutLoction( )async{


  getAttendance=true;
  update();
  Map<String,dynamic>data={};
  data["language"]="ar";
  data["branch_id"]="";
  data["lat"]= "";
  data["lang"]= "";

  data["token"]= SecureStorage.readSecureData(AllStringConst.Token)!;

  await  _attendanceAPI.post(data).then((value) async{

    attendanceModel=value as AttendanceModel;

    await SecureStorage.writeSecureData(key: AllStringConst.id,value:attendanceModel!.attendances!.id.toString());
    //  print(attendanceModel?.toJson());
    getAttendance=false;
    update();
    Get.snackbar("", attendanceModel!.msg!);

  });

}
  //
  double? dest;
  getUserLocAndDestBtwenbranchAndUser()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera,imageQuality: 40,maxHeight: 200,maxWidth: 200);
    if(photo!=null){

      getAttendance=true;
      update();

      Position? position=await   getLoction( );

 print("this my loction     ${position?.altitude}");

  if(position!=null){
    Branches? bestBranch=  branchsModel?.branches?[0];
     print("element.toJson()=>  ${branchsModel?.branches}");
    dest=50000;
     for(int i=0;i< (branchsModel?.branches?.length??0);i++) {
       print("this id bestBranch ${branchsModel?.branches?[i].id}");
       if (branchsModel!.branches![i].id==int.parse(SecureStorage.readSecureData(AllStringConst.branch_id)!)) {
         bestBranch=branchsModel!.branches![i];
         print("this iss bestBranch ${bestBranch.toJson()}");
         await getdestance(pos: position!,
             pranchlat: double.parse(bestBranch!.latitude!),
             pranchLong: double.parse(bestBranch!.longitude!)).then((value) async {
           //  print("     ${value<4000} =======${value}========       ${branchsModel!.branches![i].latitude }  = ${branchsModel!.branches![i].longitude }  =====    ${ position.latitude }= ${ position.longitude } ");


           if (true) {
             //  Get.snackbar("", "تم تسجيل الحضور");

             //    branches=branchsModel!.branches![i];
             getAttendance = true;
             update();

             var formData = di.FormData();


             formData.files.addAll([
               MapEntry("img",
                   await di.MultipartFile.fromFile(photo.path)),
             ]);

             formData.fields.add(
                 MapEntry("language", "ar"));
             // formData.fields.add(
             //     MapEntry("branch_id",branchsModel!.branches![i].id!.toString()));
             formData.fields.add(
                 MapEntry("branch_id", "1"));
             formData.fields.add(
                 MapEntry("lat", bestBranch?.latitude.toString() ?? "22"));
             formData.fields.add(
                 MapEntry("lang", bestBranch?.longitude.toString() ?? "11"));
             formData.fields.add(
                 MapEntry("token",
                     SecureStorage.readSecureData(AllStringConst.Token)!
                         .toString()));


             await _attendanceAPI.post(formData).then((value) async {
               print("44444444444444444444444444444object");
               attendanceModel = value as AttendanceModel;

               await SecureStorage.writeSecureData(key: AllStringConst.id,
                   value: attendanceModel?.attendances?.id.toString()??1.toString());
               //  print(attendanceModel?.toJson());

                  Get.snackbar("", "${attendanceModel!.msg! } الفرع${branchsModel!.branches![i]!.name}  ");

               getAttendance = false;
               update();
             });
           }
           else {
             getAttendance = false;
             update();
             // Get.snackbar("", "تحتاج الي الدخول داخل الفرع اقرب فرع لك هو ${bestBranch?.name}");

               Get.snackbar("", " تواجد بجوار اقرب فرع لك");
           }

           getAttendance = false;
           update();

           // if(dest!>value){
           //  print("--------------------------------------------------------------------");
           //   dest=value;
           //   bestBranch=branchsModel!.branches![i];
           //   print("the   bestBranch is   ${bestBranch!.name}    $dest ");
           // }


         });
       }
       // else {
       //
       //   Get.snackbar("خطاء", "خطاء برجا غلق التطبيق و الدخول مرة اخري");
       //   getAttendance = false;
       //   update();
       // }
     }

    }else{
    getAttendance = false;
    update();
    Get.snackbar("خطاء", "يجب تشغيل خدمة تحديد المواقع");

  }
       // branchsModel!.branches![i].latitude!   //branchsModel!.branches![i].longitude!

     // }
    }

//     branchsModel?.branches?.forEach((element) async{
// if(position!=null){
//   dest=8600.0;
//  await getdestance(pos: position!,pranchlat: element.latitude,pranchLong: element.longitude).then((value) {
//
// print("IS dest>value    ${dest!>value}    $dest   $value    ${element.name}");
//     if(dest!>value){
//        dest=value;
//       bestBranch=element;
//     }
//
//   });
// }else{
//   Get.snackbar("", "لم نتمكن من الحصول علي مكان المستخدم");
// }
//
//
//     });


    //
    // print("3");
    // print("the          $dest");
    // print("the          ${dest!.toInt()<8600.0}");
   //  if(dest!.toInt()<100.0 ){
   //  //  Get.snackbar("", "تم تسجيل الحضور");
   //
   //
   //    getAttendance=true;
   //    update();
   //    Map<String,dynamic>data={};
   //    data["language"]="ar";
   //    data["branch_id"]=bestBranch!.id!;
   //    data["lat"]=position?.latitude;
   //    data["lang"]=position?.longitude;
   //
   //    data["token"]= SecureStorage.readSecureData(AllStringConst.Token)!;
   //
   //  await  _attendanceAPI.post(data).then((value) async{
   //
   //      attendanceModel=value as AttendanceModel;
   //
   //      await SecureStorage.writeSecureData(key: AllStringConst.id,value:attendanceModel!.attendances!.id.toString());
   //    //  print(attendanceModel?.toJson());
   //
   // Get.snackbar("", "${attendanceModel!.msg! } الفرع${bestBranch!.name}  ");
   //
   //    });
   //
   //  }else{
   //    print("destdest       $dest    ");
   //    Get.snackbar("", "تحتاج الي الدخول داخل الفرع اقرب فرع لك هو ${bestBranch?.name}");
   //  }
   //  getAttendance=false;
   //  update();

  }

  bool ischechout=false;
  chechout(){
    ischechout=true;
    update();
    ChechoutAPI chechoutAPI=ChechoutAPI();
    Map<String,dynamic>data={};
    data["language"]="ar";

    data["token"]= SecureStorage.readSecureData(AllStringConst.Token)!;
    data["attendance_id"]= SecureStorage.readSecureData(AllStringConst.id)!;
  //  chechoutAPI.data=;
    chechoutAPI.post(data).then((value) {
      ChechoutModel  chechoutModel=value as ChechoutModel;
      Get.snackbar("", chechoutModel.msg??"");


      ischechout=false;
      update(); });
  }

  getBranchs(){
    _branchsAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}";
  _branchsAPI.getData().then((value) {
    branchsModel =value as BranchsModel;
    print("branchsModel?.toJson()=>    ${branchsModel?.toJson()}");
  });
  }
}