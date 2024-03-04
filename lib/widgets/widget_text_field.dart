import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';
var maskFormatter = new MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.eager
);
class RedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? isMaskphone;
  final String? topText;
  final IconData? prefixIcon;
  final TextInputType? inputType;
  final String? errorText;

  const RedTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.topText,
    this.isMaskphone = false,
    this.prefixIcon,
    this.inputType,
    this.errorText,
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
          SizedBox(height: 5.5),
          TextField(

            inputFormatters: isMaskphone!?[maskFormatter]:[],
            controller: controller,
            keyboardType: inputType,
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 15.5),
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(prefixIcon!, color: AppColor.red3),

              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 13.5,
                color: AppColor.textColor,
                fontWeight: FontWeight.w300,
              ),
              fillColor: AppColor.red5,
              filled: true,
              errorText: errorText,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Color(0x62e7344a),
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              border:   OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Color(0x62e7344a),
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: AppColor.red5,
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
