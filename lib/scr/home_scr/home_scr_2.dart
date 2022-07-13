
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'package:file_picker/file_picker.dart';
class HomeScr2 extends StatelessWidget {
  const HomeScr2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(" تعليمات صوتيه"),
          actions: [Icon((Icons.notifications_outlined))]),
      body: GetBuilder<HomeController>(builder: (logic) {
        return logic.allAudiosModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: logic.allAudiosModel?.media?.length,
                itemBuilder: (context, pos) {
                  return Card(
                    child: Container(
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.find<HomeController>().playAudio(logic
                                      .allAudiosModel!.media![pos].media!);
                                },
                                child: Icon(Icons.play_arrow)),
                            Text( "user id ${logic.allAudiosModel!.media![pos].id.toString()}"),
                          ]),
                    ),
                  );
                });
      }),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: ()async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path!);

            Get.find<HomeController>(). uploadAudio(file);
           // Get.find<HomeController>().uploadideo(file);
          } else {
            // User canceled the picker
          }
        }, label:  Text("ملف صوتي"),icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
