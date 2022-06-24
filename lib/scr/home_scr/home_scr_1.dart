import 'package:elngar/utility/app_colors.dart';
import 'package:flutter/material.dart';

import '../shareWidget/home_widget.dart';

class HomeScr1 extends StatelessWidget {
  String time = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.notifications_outlined,color: Colors.blueAccent),
          Text("مرحبا",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color:ColorApp. greenColor)),
              Text('محمد احمد',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
             ],
          ),
          HomeWidget(titel: '',)  ],
      ),
    );
  }
}
