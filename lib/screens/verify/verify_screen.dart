import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/app_style.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    child: Image.asset(
                      AppImages.appLogo,
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
                Positioned(
                  child: Text("Kodni Tasdiqlash",
                      style: AppStyle.styleMainSp29W600Rub),
                  bottom: 50, // Matn pastdagi masofani o'zgartirish
                ),

              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          buildPinPut()
        ],
      ),
    );
  }

  Widget buildPinPut() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColor.red6,
        border: Border.all(color: AppColor.red1),
        borderRadius: BorderRadius.circular(15),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith();
    final defaultUnBorder = defaultPinTheme.copyWith(

      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xd5979e)

      )
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColor.red1,
      ),
    );

    return Pinput(
      keyboardType: TextInputType.number,

      defaultPinTheme: defaultUnBorder,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      pinAnimationType: PinAnimationType.rotation,
      length: 6,
      showCursor: true,
      onCompleted: (pin) => {


      },
    );
  }
}
