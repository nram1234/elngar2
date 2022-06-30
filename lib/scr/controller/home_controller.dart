import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart' as di;
import '../../rep/api/all_audios_api.dart';
import '../../rep/api/all_holiday_api.dart';
import '../../rep/api/all_videos_api.dart';
import '../../rep/api/logout_api.dart';
import '../../rep/api/upload_video_api.dart';
import '../../rep/json_model/all_audios_model.dart';
import '../../rep/json_model/all_holiday_model.dart';
import '../../rep/json_model/all_videos_model.dart';
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

  AllHolidayModel? allHolidayModel;
  AllAudiosModel? allAudiosModel;
  AllVideosModel? allVideosModel;
  int indexINProfile=0;
List<VideoPlayerController>listOfVideoPlayerController=[];
  int index=0;
  List<Widget>screens=[HomeScr1(),HomeScr2(),HomeScr3(),HomeScr4()];
Widget? screen;

setindexINProfile(int i){
  indexINProfile=i;
  update();
}
  @override
  void onInit() {
    super.onInit();
    _getId();
    screen=screens[index];
   // getdestance();
    getPositionAsStream();
    getAllHoliday();
    getAllAudios();
    getAllVideos();
  }

    myScr(int index){
    this.index=index;
    screen=screens[index];
    update();
  }

logout(){




  SecureStorage.deleteSecureData(AllStringConst.Token);
  _logOutAPI.post({"token":SecureStorage.readSecureData(AllStringConst.Token),"language":"ar"}).then((value) {

    Get.toNamed("Login");
  });
}
getAllHoliday(){
  _allHolidayAPI.data="?token=${SecureStorage.readSecureData(AllStringConst.Token)}";
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
    allVideosModel?.videos?.forEach((element)  {
      VideoPlayerController videoPlayerController=VideoPlayerController.network(
          element.media!)
        ..initialize();

      listOfVideoPlayerController.add(videoPlayerController);
    });
    print(allVideosModel?.toJson());
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
    var request = http.MultipartRequest('POST', Uri.parse('https://safsooofa.com/api/uploadVideo'));
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
    var request = http.MultipartRequest('POST', Uri.parse('https://safsooofa.com/api/uploadAudio'));
    request.fields.addAll({
      'language': 'en',
      'token':   SecureStorage.readSecureData(AllStringConst.Token)!
    });
    request.files.add(await http.MultipartFile.fromPath('media', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    getAllAudios();
    print("upload ddddddd");
    }
    else {
    print(response.reasonPhrase);
    }

  }
}