import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/widgets/widget_text_field.dart';

import '../verify/VerifyBottomSheet.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
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
                    child: Text("Ro’yxatdan o’tish",
                        style: AppStyle.styleMainSp29W600Rub),
                    bottom: 60,
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
