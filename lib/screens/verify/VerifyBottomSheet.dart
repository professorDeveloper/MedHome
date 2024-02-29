import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../utils/app_color.dart';

Future<dynamic> verifyBottomSheet(BuildContext context) {
  final _otpPinFiledController = GlobalKey<OtpPinFieldState>();
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
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
                SizedBox(height: 40),
                Text(
                  "Kodni tasdiqlash",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w600,
                    fontSize: 29,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 50),
                OtpPinField(
                    onSubmit: (text) {},
                    onChange: (text) {},
                    key: _otpPinFiledController,
                    autoFillEnable: false,

                    otpPinFieldStyle: OtpPinFieldStyle(

                      filledFieldBackgroundColor: AppColor.red1,
                      filledFieldBorderColor: AppColor.red1,

                      defaultFieldBackgroundColor: AppColor.red6,
                      activeFieldBorderColor:AppColor.red1,
                        textStyle: TextStyle(
                      fontSize: 16,
                      color: AppColor.white,
                    )),
                    maxLength: 6,

                    fieldWidth: 50,
                    fieldHeight: 60,

                    showDefaultKeyboard: true,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
                SizedBox(
                  height: 40,
                ),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Tasdiqlash"),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
