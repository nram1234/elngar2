import 'package:flutter/material.dart';

class HomeScr2 extends StatelessWidget {
  const HomeScr2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("فيديو"),
          actions: [Icon((Icons.notifications_outlined))]),body: ListView.builder(itemCount: 100,itemBuilder: (context,pos){
      return Card(
        child: Container(height: 60,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(Icons.play_arrow)
            ,Text("how to make voice"),

          ]),
        ),
      );    }),
    );
  }
}
