import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/doctors/search_medical_screen.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../profile/profile_screen.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  bool isSavable = false;
  var selectedGender = -1;

  bool _isVisibleGender = false;
  bool _isVisibleAge = false;
  bool _isVisibleButton = false;
  bool isChanged = false;
  var count = 0;
  var countAge = 0;
  List<String> options = [
    '0-2 yosh',
    '2-12 yosh',
    '12-16 yosh',
  ];

  List<String> optionsForOld = [
    '60 gacha',
    '60 dan',
  ];

  String selectedOption = '';

  void _toggleVisibility(bool isVisible) {
    setState(() {
      _isVisibleGender = isChanged;
      _toggleAgeVisibility(isVisible);
      _toggleButtonVisibility(isVisible);
    });
  }

  void _toggleButtonVisibility(bool isVisible) {
    setState(() {
      if (selectedOption.isNotEmpty) {
        _isVisibleButton = isChanged;
      } else {
        _isVisibleButton = false;
      }
    });
  }

  void _toggleAgeVisibility(bool isVisible) {
    setState(() {
      if (selectedGender != -1) {
        _isVisibleAge = isChanged;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context),
      backgroundColor: AppColor.gray1,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Qidiruv",
                  style: GoogleFonts.rubik(
                      fontSize: 18,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Tibbiy Kartani Tanlang",
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: AppColor.unselctedColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              borderOnForeground: true,
              elevation: 1,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  print('asdasd');
                },
                borderRadius: BorderRadius.all(Radius.circular(11)),
                child: Container(
                  height: 62,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.add,
                        color: AppColor.red1,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Tibbiy kartani qo’shing",
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isChanged = !isChanged;
                    count++;
                    _toggleVisibility(true);
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
                            isChanged = !isChanged;
                            count++;
                            _toggleVisibility(true);
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
            ),
            SizedBox(height: 4),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: _buildChoseGender(context: context)),
            SizedBox(height: 6),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: _buildChooseAge(context: context)),
            SizedBox(height: 6),
            _buildButton(context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required BuildContext context}) {
    return AnimatedOpacity(
      opacity: _isVisibleButton ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        child: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          onPressed: () async {
            openScreen(context, SearchMedicalScreen());
          },
          color: AppColor.red1,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("Keyingisi"),
        ),
      ),
    );
  }

  Widget _buildChooseAge({required BuildContext context}) {
    return AnimatedOpacity(
      opacity: _isVisibleAge ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Sizning Yosh Guruhingiz",
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.unselctedColor),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bolalar",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.unselctedColor)),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "16 yoshgacha",
                          style: GoogleFonts.rubik(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Wrap(
                          spacing: 4.0,
                          children: options.map((ageGroup) {
                            return Theme(
                              data: ageGroup == selectedOption
                                  ? ThemeData.dark()
                                  : ThemeData.light(),
                              child: ChoiceChip(
                                label: Text(ageGroup),
                                labelStyle: GoogleFonts.rubik(
                                    color: selectedOption == ageGroup
                                        ? AppColor.white
                                        : AppColor.textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                selectedColor: AppColor.red4,
                                selected: selectedOption == ageGroup,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedOption = selected ? ageGroup : '';
                                    _toggleButtonVisibility(true);
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          color: AppColor.unselctedColor,
                          width: double.infinity,
                          height: 2,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("Kattalar",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.unselctedColor)),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "16 yoshdan katta",
                          style: GoogleFonts.rubik(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Wrap(
                          spacing: 4.0,
                          children: optionsForOld.map((ageGroup) {
                            return Theme(
                              data: ageGroup == selectedOption
                                  ? ThemeData.dark()
                                  : ThemeData.light(),
                              child: ChoiceChip(
                                label: Text(ageGroup),
                                labelStyle: GoogleFonts.rubik(
                                    color: selectedOption == ageGroup
                                        ? AppColor.white
                                        : AppColor.textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                selectedColor: AppColor.red4,
                                selected: selectedOption == ageGroup,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedOption = selected ? ageGroup : '';
                                    _toggleButtonVisibility(true);
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoseGender({required BuildContext context}) {
    return AnimatedOpacity(
      opacity: _isVisibleGender ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: Container(
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
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Birinchi container bosilsa
                      setState(() {
                        selectedGender = 1;
                        _toggleAgeVisibility(true);
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
                  child: GestureDetector(
                    onTap: () {
                      // Ikkinchi container bosilsa
                      setState(() {
                        selectedGender = 2;
                        _toggleAgeVisibility(true);
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
                      Scaffold.of(context).openDrawer();
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
                      onPressed: (() => {}),
                      icon: Icon(
                        CupertinoIcons.bell_fill,
                        size: 23,
                        color: AppColor.red4,
                      )),
                ),
                IconButton(
                    onPressed: (() => {openScreen(context, MyProfile())}),
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
