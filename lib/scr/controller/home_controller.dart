import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home_scr/home_scr_1.dart';
import '../home_scr/home_scr_2.dart';
import '../home_scr/home_scr_3.dart';
import '../home_scr/home_scr_4.dart';

class HomeController extends GetxController{



  int indexINProfile=0;

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
    screen=screens[index];
  }

    myScr(int index){
    this.index=index;
    screen=screens[index];
    update();
  }




}