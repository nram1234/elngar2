import 'package:elngar/scr/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main(){

  test("firest",(){
    HomeController homeController= HomeController();
    homeController.fortest(1);

expect(homeController.ttt, 1);

    homeController.setindexINProfile(5);
    expect(homeController.indexINProfile, 5);



  });





}