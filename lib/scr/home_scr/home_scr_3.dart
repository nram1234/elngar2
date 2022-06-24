import 'package:flutter/material.dart';

class HomeScr3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("تعليمات صوتيه"),
          actions: [Icon((Icons.notifications_outlined))]),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, pos) {


                          return Card(child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text("how to make"),Container(height: 100,width: 100,color: Colors.red,)]),);


          }),
    );
  }
}
