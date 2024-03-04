import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/widgets/widget_text_field.dart';

import '../verify/VerifyBottomSheet.dart';

class RegisterPhoneVerfyScreen extends StatefulWidget {
  const RegisterPhoneVerfyScreen({super.key});

  @override
  State<RegisterPhoneVerfyScreen> createState() => _RegisterPhoneVerfyScreenState();
}

class _RegisterPhoneVerfyScreenState extends State<RegisterPhoneVerfyScreen> {
  bool isSavable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Image.asset(
                        AppImages.appLogo,
                        fit: BoxFit.fill,
                        height: 270,
                        width: 270,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35, // Adjust this value to control the distance from the bottom
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Ro’yxatdan o’tish", style: AppStyle.styleMainSp29W600Rub),
                    ),
                  ),
                ],
              ),
            ),
            RedTextField(
              topText: "Telefon raqam :",
              hintText: "+998 (97) 977-97-97",
              prefixIcon: CupertinoIcons.phone,
              inputType: TextInputType.phone,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSavable = !isSavable;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: isSavable,
                    onChanged: (it) {
                      setState(() {
                        isSavable = !isSavable;
                      });
                    },
                    activeColor: AppColor.red4,
                    focusColor: AppColor.red4,
                    side: BorderSide(color: AppColor.red4),
                  ),
                  Text(
                    "Foydalanish qoidalariga rozi bo’lish",
                    style: GoogleFonts.zenMaruGothic(
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      color: AppColor.textColor,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: MaterialButton(
                elevation: 0,
                focusElevation: 0,
                onPressed: () {
                  verifyBottomSheet(context);
                },
                color: AppColor.red1,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Ko’dni qabul qilish"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
