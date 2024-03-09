import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

Flushbar showErrorFlushBar(String text) {
  return Flushbar(
    titleText: Text("Xato !", style: AppStyle.styleRed4Sp16W900Zen),
    messageText: Text(
      text,
      style: AppStyle.styleMainSp14W600Rub,
    ),
    margin: EdgeInsets.all(8),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: AppColor.gray1,
    barBlur: 200,
    routeBlur: 200,
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
       Icons.error,
      color: Colors.red,
      size: 24,
    ),
    duration: const Duration(seconds: 3),
  );
}

Flushbar showSuccessFlushBar(String text){
 return  Flushbar(
    titleColor: Colors.green,
    titleText: Text("Muvaffaqiyatli",
        style: AppStyle.styleGreen4Sp16W900Zen),
    messageText: Text(
      text,
      style: AppStyle.styleMainSp14W600Rub,
    ),
    margin: EdgeInsets.all(8),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: AppColor.gray1,
    barBlur: 200,
    routeBlur: 200,
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
      Icons.check,
      color: Colors.green,
      size: 24,
    ),
    duration: const Duration(seconds: 3),
  );

}