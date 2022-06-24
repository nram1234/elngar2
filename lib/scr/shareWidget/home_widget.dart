import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
final  String titel;
 final Color color;
 final double height;
  final double width;
  final String path;

HomeWidget({required this.titel,required this.color,required this.height,required this.width,required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:height,width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Row(children: [
            Spacer(),
            Text(titel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
            Spacer(),
            Image.asset(path),SizedBox(width: 20,)
          ]),
        ),
      ),
    );
  }
}
