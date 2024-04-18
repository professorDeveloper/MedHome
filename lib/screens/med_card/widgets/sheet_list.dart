// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class CustomSheetList extends StatelessWidget {
  String? text;
  bool? isCheck;
  CustomSheetList({
    Key? key,
    this.text,
    this.isCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            text.toString(),
            style: GoogleFonts.rubik(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Spacer(),
          Checkbox(
            side: BorderSide(color: AppColor.red4),
            activeColor: AppColor.red4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            value: isCheck,
            onChanged: (bool? value) {},
          )
        ],
      ),
    );
  }
}
