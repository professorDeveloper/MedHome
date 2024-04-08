import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import 'doctor_information_screen.dart';

class SearchMedicalScreen extends StatefulWidget {
  const SearchMedicalScreen({Key? key}) : super(key: key);

  @override
  State<SearchMedicalScreen> createState() => _SearchMedicalScreenState();
}

class _SearchMedicalScreenState extends State<SearchMedicalScreen> {
  var selectedGender = 1;
  var selectedLanguage = "uz";
  var selectedPaymentType = true;
  var isChanged = false;
  var disableLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,

      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        height: 115,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Narxi:",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "500 000 so’m",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: MaterialButton(
                elevation: 0,
                focusElevation: 0,
                onPressed: () {
                  openReplaceScreen(context, DoctorInformationScreen());
                },
                color: AppColor.red1,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("Keyingisi"),
              ),
            ),
          ],
        ),
      ),
      appBar: _appBar(contxt: context),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 4,
                ),
                // Row(
                //   children: [
                //     Spacer(),
                //     Text(
                //       "Qidiruv",
                //       style: GoogleFonts.rubik(
                //           fontSize: 18,
                //           color: AppColor.textColor,
                //           fontWeight: FontWeight.w500),
                //     ),
                //     Spacer(),
                //   ],
                // ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Tibbiy hodim",
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Tibbiy hodimini jinsini tanlang",
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        color: AppColor.idkTextGrayColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    _buildChoseGender(context: context),
                    _checkBoxContForGender(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Tibbiy hodimini tilini tanlang",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: AppColor.idkTextGrayColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    _buildChooseLanguage(context: context),
                    _checkBoxContForLanguage(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "To’lov turini tanlang",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: AppColor.idkTextGrayColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    _buildChoosePaymentType(context: context),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Manzilni ko’rsating",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: AppColor.idkTextGrayColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                      borderOnForeground: true,
                      elevation: 1,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          print('asdasd');
                        },
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            width: double.infinity,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Toshkent shahar\nChilonzor tumani, Muqumiy",
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColor.textColor),
                                ),
                                Spacer(),
                                Icon(
                                  CupertinoIcons.location_solid,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          )), //muhim
    );
  }

  Container _checkBoxContForGender() => Container(
        child: InkWell(
          onTap: () {
            setState(() {
              isChanged = !isChanged;
            });
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
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
                      isChanged = !isChanged;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Muhim Emas",
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
      );

  Container _checkBoxContForLanguage() => Container(
        child: InkWell(
          onTap: () {
            setState(() {
              disableLanguage = !disableLanguage;
            });
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColor.red4,
                  value: disableLanguage,
                  onChanged: (bool? value) {
                    setState(() {
                      disableLanguage = !disableLanguage;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Muhim Emas",
                  style: GoogleFonts.rubik(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textGrayColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

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
                      closeScreen(contxt);
                      print('"asdasdasdasdasdasd');
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: AppColor.textColor,
                    )),
                Spacer(),
                SizedBox(
                  width: 16,
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
                      "Qidiruv".toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 3, right: 10, left: 25),
                  child: IconButton(
                      onPressed: (() => {}),
                      icon: Icon(
                        CupertinoIcons.bell_fill,
                        size: 23,
                        color: AppColor.red4,
                      )),
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );

  Widget _buildChoseGender({required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Card(
        color: Colors.white,
        elevation: 0.7,
        shadowColor: AppColor.gray2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
                              fontWeight: FontWeight.w500,
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
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
    );
  }

  //
  Widget _buildChooseLanguage({required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Card(
        color: Colors.white,
        elevation: 0.7,
        shadowColor: AppColor.gray2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onTap: () {
                    // Birinchi container bosilsa
                    setState(() {
                      selectedLanguage = "uz";
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 65,
                    decoration: BoxDecoration(
                      color: selectedLanguage == "uz"
                          ? AppColor.red4
                          : AppColor.containerGrayColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'UZ',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: selectedLanguage == "uz"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onTap: () {
                    // Ikkinchi container bosilsa
                    setState(() {
                      selectedLanguage = "ru";
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 65,
                    decoration: BoxDecoration(
                      color: selectedLanguage == "ru"
                          ? AppColor.red4
                          : AppColor.containerGrayColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'RU',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: selectedLanguage == "ru"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
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
    );
  }

  Widget _buildChoosePaymentType({required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Card(
        color: Colors.white,
        elevation: 0.7,
        shadowColor: AppColor.gray2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onTap: () {
                    // Birinchi container bosilsa
                    setState(() {
                      selectedPaymentType = true;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 65,
                    decoration: BoxDecoration(
                      color: selectedPaymentType == true
                          ? AppColor.red4
                          : AppColor.containerGrayColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Naqd',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: selectedPaymentType == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onTap: () {
                    // Ikkinchi container bosilsa
                    setState(() {
                      selectedPaymentType = false;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 65,
                    decoration: BoxDecoration(
                      color: selectedPaymentType == false
                          ? AppColor.red4
                          : AppColor.containerGrayColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Karta',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: selectedPaymentType == false
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
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
    );
  }
}
//recreation
