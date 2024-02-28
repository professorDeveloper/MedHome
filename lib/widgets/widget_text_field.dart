import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';

class RedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? isMaskRam;
  final String? topText;
  final IconData? prefixIcon;
  final TextInputType? inputType; // Add this line

  const RedTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.topText,
    this.isMaskRam = false,
    this.prefixIcon,
    this.inputType, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 3),
                child: Text(
                  topText.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.5,),
          TextField(
            controller: controller,

            keyboardType: inputType, // Set the keyboardType dynamically
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 15.5),
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(prefixIcon!, color: AppColor.red3),
              ),

              hintText: hintText,
              fillColor: AppColor.red5,
              filled: true,
              hintStyle: GoogleFonts.poppins(
                fontSize: 13.5,
                color: AppColor.textColor,
                fontWeight: FontWeight.w300,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: AppColor.red5,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Color(0x62e7344a),
                  width: 2.0,
                ),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
            ),
          ),
        ],
      ),
    );
  }
}
