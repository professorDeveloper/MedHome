import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/profile/profile_screen.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/widgets/flushbar.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_images.dart';

class DoctorIdentityScreen extends StatefulWidget {
  const DoctorIdentityScreen({Key? key}) : super(key: key);

  @override
  State<DoctorIdentityScreen> createState() => _DoctorIdentityScreenState();
}

class _DoctorIdentityScreenState extends State<DoctorIdentityScreen> {
  bool isChanged = true;
  var selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text("Buyurtmalar",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColor.textColor)),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tibbiy Kartani tanlang",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColor.textGrayColor),
                      ),
                      SizedBox(height: 14),
                      Container(
                        height: 58,
                        width: 370,
                        child: MaterialButton(
                          elevation: 1,
                          highlightElevation: 0,
                          focusElevation: 0,
                          onPressed: () async {},
                          color: AppColor.white,
                          textColor: AppColor.textColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 13,
                              ),
                              Icon(
                                Icons.add,
                                size: 30,
                                color: AppColor.red4,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Tibbiy kartani qo’shing",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: AppColor.textColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showErrorFlushBar("Sizda Tibbiy Karta Mavjud Emas").show(context);
                          });
                        },
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppColor.red4,
                                value: isChanged,
                                onChanged: (bool? value) {
                                  setState(() {
                                    showErrorFlushBar("Sizda Tibbiy Karta Mavjud Emas").show(context);
                                  });
                                }),
                            Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Text(
                                "Tibbiy kartasiz",
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textGrayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 80,
                        width: 370,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          shadowColor: AppColor.gray2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Expanded
                                    (
                                    child: GestureDetector(
                                    onTap: () {
                                      // Birinchi container bosilsa
                                      setState(() {
                                        selectedGender = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: selectedGender == 1
                                            ? AppColor.red4
                                            : AppColor.containerGrayColor,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              AppImages.icMale,
                                              width: 40,
                                              height: 50,
                                            ),
                                            SizedBox(
                                              width: 14,
                                            ),
                                            Text(
                                              'Erkak',
                                              style: GoogleFonts.rubik(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: selectedGender == 1
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                                                    ),
                                  ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Ikkinchi container bosilsa
                                      setState(() {
                                        selectedGender = 2;
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: selectedGender == 2
                                            ? AppColor.red4
                                            : AppColor.containerGrayColor,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                  
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              AppImages.icFemale,
                                              width: 40,
                                              height: 50,
                                            ),
                                            SizedBox(
                                              width: 14,
                                            ),
                                            Text(
                                              'Ayol',
                                              style: GoogleFonts.rubik(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: selectedGender == 2
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Tibbiy Kartani tanlang",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColor.textGrayColor),
                      ),
                    ],
                  )),
            ]),
          )),
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
                      print('"asdasdasdasdasdasd');
                    },
                    icon: Icon(
                      Icons.arrow_back,
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
                      onPressed: (() => {}),
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
