import 'package:elngar/scr/shareWidget/custom_button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          Expanded(flex: 4, child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            
              decoration: InputDecoration(hintText:"ادخل رقم الموظف",
                //suffixIcon: Icon(Icons.remove_red_eye_rounded),
                prefixIcon: Icon(Icons.remove_red_eye_rounded),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            ),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(hintText: "********",
               //suffixIcon: Icon(Icons.remove_red_eye_rounded),
                prefixIcon: Icon(Icons.remove_red_eye_rounded),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            ),
          ),
          CustomButton(
            title: 'دخول', height: 50, width: size.width * .8, onClick: () {},),
          Expanded(flex: 2, child: SizedBox())
        ]),
      ),
    );
  }
}









