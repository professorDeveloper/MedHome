import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
        border: Border.all(color: Color(0xFFFF5840)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith();
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xFFFF5840),
      ),
    );

    return Pinput(
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return "";
      },
      pinAnimationType: PinAnimationType.rotation,
      length: 6,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
