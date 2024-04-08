import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool isUz = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 25),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isUz = !isUz;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: isUz ? AppColor.red1 : AppColor.gray2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "UZ".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: isUz ? Colors.white : AppColor.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isUz = !isUz;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: isUz ? AppColor.gray2 : AppColor.red1,
              ),
              child: Center(
                child: Text(
                  "RU".toString(),
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: isUz ? AppColor.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColor.gray2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "EN".toString(),
                style: GoogleFonts.rubik(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
