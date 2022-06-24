import 'package:flutter/material.dart';
class ColorApp{

static Color primaryColor = HexColor("#1068FD");
static Color   accentColor   = HexColor('#D4AA3A');
static Color greenColor =  HexColor("#81D886");
static Color redColor =  HexColor("#F90606");
static Color lastItemInHome =  HexColor("#FFB680");
static Color lightB =  Color(0xff98d2e8);
static Color whiteColor =  Color(0xfff5f5f5);
static Color blackFontColor =  Color(0xfff303952);
static Color lightGreyColor =  Color.fromRGBO(223,223,223,1);
static Color lightGreyColor2 =  Color(0xffcbcbcb);
static Color lightGreyColor3=  Color(0xffeceaea);








}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}