import 'package:flutter/material.dart';

import '../../../utility/app_colors.dart';
import '../../shareWidget/home_widget.dart';

class Tap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
            child: HomeWidget(
          path: "assets/pu.png",
          titel: 'انشاء طلب اجازة',
          height: 60,
          color: ColorApp.lastItemInHome.withOpacity(.3),
          width: size.width * .9,
        )),
        Expanded(child: ListView.builder(itemCount: 100,itemBuilder: (cont, pos) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(elevation: 8,
                child: Column(
              children: [
                item(val: "64446", titel: "تاريخ الطلب"),
                item(val: "64446", titel: "عدد الايام"),
                item(val: "64446", titel: "تاريخ بداية الاجازه"),
                item(val: "64446", titel: "تاريخ نهاية الاجازة"),
                item(val: "64446", titel: "الرد علي طلب الاجازه"),
              ],
            )),
          );
        }))
      ],
    );
  }

  Widget item({titel, val}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20),
      child: Directionality(textDirection: TextDirection.rtl,
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [ Expanded(flex: 4, child: Text(titel)),Expanded(flex: 4,child: Text(val))],
        ),
      ),
    );
  }
}
