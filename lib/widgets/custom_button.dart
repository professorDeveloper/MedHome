import 'package:flutter/material.dart';
import 'package:medhome/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? radius;
  final Color? bgColor;
  final Color? textColor;
  //margin
  final EdgeInsetsGeometry? margin;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.radius,
      this.margin,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor ?? AppColor.red4,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
