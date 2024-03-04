import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/forget/forget_verfy_screen.dart';
import 'package:medhome/utils/app_color.dart';

import '../../widgets/widget_text_field.dart';

Future<dynamic> forgotBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          height: 350,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 35),
              Text(
                "Parolni unutdingizmi ?",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: AppColor.textColor,
                ),
              ),
              SizedBox(height: 30),
              RedTextField(
                topText: "Telefon raqam :",
                hintText: "+998 (97) 977-97-97",
                prefixIcon: CupertinoIcons.phone,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  focusElevation: 0,
                  onPressed: () {
        forgetVerfySheet(context);
                  },
                  color: AppColor.red1,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text("Ko’dni qabul qilish"),
                ),
              ),
            ],
          ),
        );
      });
}
