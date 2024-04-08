import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class DoctorInformationScreen extends StatefulWidget {
  const DoctorInformationScreen({super.key});

  @override
  State<DoctorInformationScreen> createState() =>
      _DoctorInformationScreenState();
}

class _DoctorInformationScreenState extends State<DoctorInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: _appBar(contxt: context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  CustomAnimationsSlide(
                    direction: FadeSlideDirection.ltr,
                    duration: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        AppImages.doctorImg,
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      CustomAnimationsSlide(
                        duration: 0.5,
                        child: Text(
                          "Muslima A.",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            color: AppColor.textColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomAnimationsSlide(
                        duration: 0.6,
                        child: Text(
                          "Kardiolist",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColor.idkTextGrayColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomAnimationsSlide(
                        duration: 0.7,
                        child: Text(
                          "Tel: +998 (99) 998 88 88",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColor.idkTextGrayColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,

                        ignoreGestures: true,
                        // <---- add this
                        itemSize: 25,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomAnimationsSlide(
                duration: 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Mijozlar :",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColor.idkTextGrayColor),
                                ),
                                Text(
                                  "4320+",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.textColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 140,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Tajriba :",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColor.idkTextGrayColor),
                                ),
                                Text(
                                  "5 yil+",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.textColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CustomAnimationsSlide(
                    duration: 0.9,
                    child: Text(
                      "Malumotnoma :",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Expanded(
                    child: CustomAnimationsSlide(
                  duration: 1,
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Leo amet non lectus ut. Ac enim volutpat risus aenean sit a. Aenean dolor turpis mauris vel pellentesque. Cursus viverra volutpat facilisis enim enim nibhLorem ipsum dolor sit amet consectetur. Leo amet non lectus ut. Ac enim volutpat risus aenean sit a. Aenean dolor turpis.",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.idkTextGrayColor,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ));
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
                      "MedHome".toString(),
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
                SizedBox(
                  width: 5,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );
}
