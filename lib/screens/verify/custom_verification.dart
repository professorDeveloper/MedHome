import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../utils/app_color.dart';

class MyOTPView extends StatefulWidget {
  @override
  _MyOTPViewState createState() => _MyOTPViewState();
}

class _MyOTPViewState extends State<MyOTPView> {
  final _otpPinFiledController = GlobalKey<OtpPinFieldState>();
  List<String> otp = List.filled(6, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpPinField(
                onSubmit: (text) {},
                onChange: (text) {},
                key: _otpPinFiledController,
                autoFillEnable: false,
                otpPinFieldStyle: OtpPinFieldStyle(
                    textStyle: TextStyle(
                  fontSize: 16,
                  color: AppColor.textColor,
                )),
                maxLength: 6,
                showDefaultKeyboard: true,

                /// to select cursor width
                mainAxisAlignment: MainAxisAlignment.center,

                /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                otpPinFieldDecoration:
                    OtpPinFieldDecoration.defaultPinBoxDecoration)
          ],
        ),
      ),
    );
  }
}