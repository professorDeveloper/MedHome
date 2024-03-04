import 'package:flutter/material.dart';
//
// int pxToDp(int pixels) {
//   int logicalPixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).devicePixelRatio.toInt();
//    var a= pixels / logicalPixelRatio;
//    return int.parse(a);
// }
String convertPhoneNumber(String input) {
  // Remove non-numeric characters from the input string
  String result = input.replaceAll(RegExp(r'[^0-9]'), '');

  return "+"+result;
}
