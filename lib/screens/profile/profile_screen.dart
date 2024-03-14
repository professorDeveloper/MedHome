import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/widgets/profile_container.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context, function: (){

      }),
        backgroundColor:Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ism Familiya Otchestvo",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          "20.02.2002",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatsContainer(
                      statText: 'Bo’y :',
                      statValue: '1.80 m',
                    ),
                    StatsContainer(
                      statText: 'Vazn :',
                      statValue: '58 Kg',
                    ),
                    StatsContainer(
                      statText: 'BMI :',
                      statValue: 'Good',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInformation(
                      mainText: "Shaxsiy ma’lumotlar",
                      image: AssetImage("assets/images/avatar.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileInformation(
                      mainText: "Saralangan",
                      image: AssetImage("assets/images/star.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/images/family.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Oilaviy anketalar",
                                    style: GoogleFonts.zenMaruGothic(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  Text(
                                    "1 oila a’zosi mavjud",
                                    style: GoogleFonts.zenMaruGothic(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.red1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 31,
                              color: AppColor.white,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Profildan chiqish",
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _appBar(
      {required BuildContext contxt, required Function()? function}) =>
      AppBar(
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
                SizedBox(width: 5,),
                IconButton(
                    onPressed: (() => {}),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: AppColor.textColor,
                    )),
                Spacer(),
                SizedBox(
                  width: 10,
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
                        size: 30,
                        color: AppColor.red4,
                      )),
                ),
                SizedBox(width: 20,),

              ]),
        ),

        automaticallyImplyLeading: false,
      );
}
