import 'package:flutter/material.dart';

double pxToDp(double pixels) {
  double logicalPixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).devicePixelRatio;
  return pixels / logicalPixelRatio;
}
