import 'package:elngar/scr/controller/home_controller.dart';
import 'package:elngar/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_scr/home_scr_1.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (logic) {
        return Scaffold(
          body: logic.screen,
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl, child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            //backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
            selectedItemColor: ColorApp.primaryColor,
            currentIndex: logic.index,
            unselectedItemColor: Colors.grey,
            onTap: logic.myScr,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.waveform_path), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.play_arrow), label: ""),

              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: ""),

            ],
          ),
          ),
        );
      }),
    );
  }
}
