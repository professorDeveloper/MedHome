import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/widgets/profile_container.dart';

import '../utils/app_color.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Colors.black,
              ),
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  "assets/images/ic_notification.svg",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/app.png"),
                  height: 60,
                  width: 60,
                ),
                Text("Nur",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            )),
        body: Column(
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
        ));
  }
}
