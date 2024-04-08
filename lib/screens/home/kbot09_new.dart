import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/home/widgets/custom_bottom.dart';
import 'package:medhome/screens/home/widgets/custom_selecter.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../profile/profile_screen.dart';

class KBOT09Screen extends StatefulWidget {
  const KBOT09Screen({super.key});

  @override
  State<KBOT09Screen> createState() => _KBOT09ScreenState();
}

class _KBOT09ScreenState extends State<KBOT09Screen> {
  bool isMale = false;
  bool isChecked = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(
        contxt: context,
      ),
      bottomSheet: CustomBottom(),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Qidiruv".toString(),
                    style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor),
                  ),
                  Text(
                    "Tibbiy hodim".toString(),
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  "Tibbiy hodimini jinsini tanlang".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  child: Image.asset(
                    AppImages.male,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Erkak".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Spacer(),
                Container(
                  width: 45,
                  height: 45,
                  child: Image.asset(
                    AppImages.female,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Ayol".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                CupertinoCheckbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Muhim Emas".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  "Tibbiy hodimini jinsini tanlang".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          LanguageSelector(),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                CupertinoCheckbox(
                  value: isChecked2,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      isChecked2 = value!;
                    });
                  },
                ),
                Text(
                  "Muhim Emas".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  "To’lov turini tanlang".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                      color: isMale ? AppColor.red1 : AppColor.gray2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Naqd".toString(),
                        style: GoogleFonts.rubik(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: isMale ? AppColor.white : AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                      color: isMale ? AppColor.gray2 : AppColor.red1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Karta".toString(),
                        style: GoogleFonts.rubik(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: isMale ? AppColor.black : AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  "Manzilni ko’rsating".toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Toshkent shahar,\nChilonzor tumani, Muqumiy".toString(),
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor),
                  ),
                ),
                SvgPicture.asset(
                  AppImages.icLocation,
                  height: 36,
                  width: 36,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 160,
          ),
        ],
      ),
    );
  }

  AppBar _appBar({required BuildContext contxt}) => AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        toolbarHeight: 60,
        backgroundColor: Colors.grey.shade200,
        titleSpacing: 0,
        title: Container(
          width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(contxt).openDrawer();
                      Scaffold.of(contxt).openDrawer();
                      print('"asdasdasdasdasdasd');
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: AppColor.textColor,
                    )),
                Spacer(),
                SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 49,
                        height: 49,
                        child: Image.asset(
                          AppImages.app,
                        )),
                    Text(
                      "Med Home".toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: IconButton(
                      onPressed: (() => {
                            Navigator.push(
                              contxt,
                              MaterialPageRoute(
                                  builder: (context) => KBOT09Screen()),
                            )
                          }),
                      icon: Icon(
                        CupertinoIcons.bell_fill,
                        size: 23,
                        color: AppColor.red4,
                      )),
                ),
                IconButton(
                    onPressed: (() => {openScreen(contxt, MyProfile())}),
                    icon: Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 27,
                      color: AppColor.red4,
                    )),
                SizedBox(
                  width: 5,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );
}
