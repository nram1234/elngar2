
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;
class Singg extends StatefulWidget {
  const Singg({Key? key}) : super(key: key);

  @override
  _SinggState createState() => _SinggState();
}

class _SinggState extends State<Singg> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
    await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(backgroundColor: Colors.blue,
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.red[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child: SfSignaturePad(
                          key: signatureGlobalKey,
                          backgroundColor: Colors.white,
                          strokeColor: Colors.black,
                          minimumStrokeWidth: 1.0,
                          maximumStrokeWidth: 4.0),
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)))),
              SizedBox(height: 10),
              Row(children: <Widget>[
                TextButton(
                  child: Text('ToImage'),
                  onPressed: _handleSaveButtonPressed,
                ),
                TextButton(
                  child: Text('Clear'),
                  onPressed: _handleClearButtonPressed,
                )
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center));
  }
}
