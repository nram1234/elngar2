import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controller/home_controller.dart';

class HomeScr3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("فيديو"),
          actions: [Icon((Icons.notifications_outlined))]),
      body: GetBuilder<HomeController>(builder: (logic) {
        return logic.allVideosModel==null?Center(child: CircularProgressIndicator(),): ListView.builder(
            itemCount: logic.allVideosModel?.videos?.length,
            itemBuilder: (context, pos) {
              VideoPlayerController videoPlayerController=VideoPlayerController.network(
                  logic.allVideosModel!.videos![pos].media!

            //  "https://safsooofa.com/images/media/videos/BSnNrHGgofRJ1MTA9TLNX0MtheDKevuyw0F3fjzw.mp4"
              )..initialize();
              return GestureDetector(onTap: (){
                videoPlayerController.value.isPlaying
                    ? videoPlayerController.pause()
                    : videoPlayerController.play();
              },
                child: Card(elevation: 8,child: Container(height: 300,child:
                VideoPlayer(videoPlayerController)    ),),
              );



                // Card(child: Row(mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //
                //     Text(logic.allVideosModel?.videos?[pos]?.employeeId.toString()  ??""),
                //     Container(height: 100, width: 100, color: Colors.red,)
                //   ]),);
            });
      }),
      floatingActionButton: FloatingActionButton.extended(label:  Text("ملف فيديو"),icon: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: ()async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path!);

            Get.find<HomeController>(). uploadideo(file);
            // Get.find<HomeController>().uploadideo(file);
          } else {
            // User canceled the picker
          }
        },
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, );
  }
}
