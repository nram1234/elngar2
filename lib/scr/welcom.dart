import 'package:elngar/scr/shareWidget/custom_button.dart';
import 'package:flutter/material.dart';

class Welcom extends StatelessWidget {
  const Welcom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 5, child: Container()),
        Text("مرحبا بك في تطبيق\n النجار",style: TextStyle(fontSize: 26),textAlign: TextAlign.center),
        CustomButton(title: 'دخول',height: 50, width: size.width*.8, onClick: () {  },),
        Expanded(flex: 2, child: SizedBox())
      ]),
    );
  }
}









