import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
final  String titel;
 final Color colorl;
 final double height;
  final double width;

HomeWidget({required this.titel,required this.colorl,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent,
      ),
      child: Row(children: [
        Spacer(),
        Text(titel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
        Spacer(),
        Icon(Icons.notifications_outlined),
      ]),
    );
  }
}
