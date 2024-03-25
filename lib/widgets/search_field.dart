
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color backgroundColor;

  CustomSearchBar({
    required this.controller,
    required this.hintText,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: backgroundColor,

          borderRadius: BorderRadius.all(Radius.circular(13))
      ),
      child: IntrinsicWidth(
        child: TextField(
          textAlign: TextAlign.start,
          controller: controller,

          decoration: InputDecoration(
            suffixIcon: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: (){

                },
                  icon: Icon(Icons.search, color: AppColor.red3)),
            ),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: Color(0x62e7344a),
                width: 1.5,
              ),
            ),
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
              fontSize: 15,
              color: AppColor.textColor,
              fontWeight: FontWeight.w300,
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 18.5),
          ),

        ),
      ),
    );
  }
}