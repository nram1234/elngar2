import 'package:elngar/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_scr/home_scr_1.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeScr1(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
          selectedItemColor: ColorApp.primaryColor,
          currentIndex: 0,
          unselectedItemColor: Colors.grey,
          onTap: (value) {},
          items: [ BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.play_arrow), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.waveform_path), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: ""),

          ],
        ),
      ),
    );
  }
}
