import 'package:elngar/scr/shareWidget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 5, child: Image.asset("assets/logo.png")),
        Text("مرحبا بك في تطبيق\n النجار",style: TextStyle(fontSize: 26),textAlign: TextAlign.center),
        CustomButton(buttonColor: ColorApp.primaryColor,fontSize: 18,fontWeight: FontWeight.bold,title: 'دخول',height: 50, width: size.width*.8, onClick: () {
          print("00000000000000000");
          Get.toNamed("Login");
        },),
        Expanded(flex: 2, child: SizedBox())
      ]),
    );
  }
}









