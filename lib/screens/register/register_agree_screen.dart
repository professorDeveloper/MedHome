import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/app_style.dart';
import '../../widgets/widget_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedCardIndex = 0; // Initialize with an index that doesn't exist

  @override
  void initState() {
    super.initState();
  }

  void selectCard(int index) {
    setState(() {
      if (selectedCardIndex == index) {
        // Deselect if the same card is tapped again
        selectedCardIndex = -1;
      } else {
        selectedCardIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
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
                  bottom: 65,
                ),
              ],
            ),
          ),
          RedTextField(
            topText: "To`liq ism :",
            hintText: "Ism Va Familya",
            prefixIcon: CupertinoIcons.person,
            inputType: TextInputType.phone,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 80, // Adjust the height as needed
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 3),
                        child: Text(
                          "Jinsi :",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCard(0, "Erkak", AppImages.icMale),
                        // Add more cards as needed
                        buildCard(1, "Ayol", AppImages.icFemale),
                      ],
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }

  Widget buildCard(int index, String title, String iconAsset) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("Card $index selected!");
        selectCard(index);
      },
      child: Container(
        height: 50,
        width: 200,
        child: Row(
          children: [
            SizedBox(width: 10),
            SvgPicture.asset(iconAsset, height: 35, width: 35),
            SizedBox(width: 10),
            Text(
              title,
              style:
                  TextStyle(color: index == selectedCardIndex ? AppColor.white : Colors.black),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: selectedCardIndex == index ? AppColor.red4 : Color(0xffE7EDF9),
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? Radius.circular(10) : Radius.circular(0),
            bottomLeft: index == 0 ? Radius.circular(10) : Radius.circular(0),
            topRight: index == 1 ? Radius.circular(10) : Radius.circular(0),
            bottomRight: index == 1 ? Radius.circular(10) : Radius.circular(0),
          ),
        ),
      ),
    );
  }
}
