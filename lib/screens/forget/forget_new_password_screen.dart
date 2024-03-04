import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/forget/forget_verfy_screen.dart';
import 'package:medhome/utils/app_color.dart';

import '../../widgets/widget_text_field.dart';

Future<dynamic> forgetnewPassword(BuildContext context) {
  bool isPasswordVisible = true;

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
          height: 450,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Parolni tiklash",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 5.0, right: 3),
                          child: Text(
                            "Yangi parol :",
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
                    Builder(
                      builder: (context) {
                        return TextField(
                          obscureText: isPasswordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.black,
                          enableInteractiveSelection: true,
                          style: TextStyle(fontSize: 15.5),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(CupertinoIcons.lock,
                                  color: AppColor.red3),
                            ),
                            suffixIcon: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            hintText: "****************",
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
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 18.5),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 5.0, right: 3),
                          child: Text(
                            "Parolingiz  Tasdiqlang:",
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
                    Builder(
                        builder: (context) {
                          return TextField(
                            obscureText: isPasswordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            enableInteractiveSelection: true,
                            style: TextStyle(fontSize: 15.5),
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(CupertinoIcons.lock,
                                    color: AppColor.red3),
                              ),
                              suffixIcon: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: IconButton(
                                  onPressed: () {
                                  },
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              hintText: "****************",
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 18.5),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Container(
                height: 60,
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  focusElevation: 0,
                  onPressed: () {

                  },
                  color: AppColor.red1,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text("Parolni o’zgartirish"),
                ),
              ),

            ],
          ),
        );
      });
}
