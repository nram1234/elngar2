import 'package:elngar/nottoad/resizable_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resizable_widget/resizable_widget.dart';

//
// class Res extends StatefulWidget {
//   const Res({Key? key}) : super(key: key);
//
//   @override
//   _ResState createState() => _ResState();
// }
//
// class _ResState extends State<Res> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Stack(children: [ResizableWidget(children: [Container(height: 100,width: 100,color: Colors.red,),],isHorizontalSeparator: false,   // optional
//     isDisabledSmartHide: false,     // optional
//     separatorColor: Colors.white12, // optional
//     separatorSize: 4,               // optional
//     percentages: [0.2, 0.5, 0.3],   // optional
//     onResized: (infoList) =>        // optional
//     print(infoList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "),))]));
//   }
// }
// const double dragWidgetSize = 30;

const double dragWidgetSize = 30;

class Res extends StatefulWidget {
  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  double _x=0;

  double _y=0;

  @override
  Widget build(BuildContext context) {
    final areaHeight = Get.height * 0.70;
    final areaWidth = Get.width * 0.70;
    final controller = Get.put(
      ResizableWidgetController(
        initialPosition: Offset(areaWidth / 2, areaHeight / 2),
        areaHeight: areaHeight,
        areaWidth: areaWidth,
        height: areaHeight / 2,
        width: areaWidth / 2,
        minWidth: 50,
        minHeight: 50,
      ),
    );

    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Center(
              child: Stack(

                children: [
                  // Draggable<String>(
                  //   // Data is the value this Draggable stores.
                  //   data: 'red',
                  //   child: Container(
                  //     height: 120.0,
                  //     width: 120.0,
                  //   color: Colors.blue,
                  //   ),
                  //   feedback: Container(color: Colors.blue,
                  //     height: 120.0,
                  //     width: 120.0,
                  //
                  //   ),childWhenDragging: Container(),
                  // ),
                  Positioned(
                    left: _x,
                    top: _y,
                    child: Draggable(
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        color: Colors.blue,
                      ),
                      feedback:Container(
                        height: 120.0,
                        width: 120.0,
                        color: Colors.blue,
                      ),
            childWhenDragging: Container(),
                      onDragEnd: (dragDetails) {
                        setState(() {
                          _x = dragDetails.offset.dx;
                          // if applicable, don't forget offsets like app/status bar
                          _y = dragDetails.offset.dy  - 50 - 50;
                        });
                      },
                    ),
                  ) ],
              ),
            ),
          )),
    );
  }
}
