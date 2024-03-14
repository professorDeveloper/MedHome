import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class MedkartaScreen extends StatelessWidget {
  const MedkartaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray1,
        appBar: _appBar(contxt: context, function: () {}),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 110,
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
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        AppImages.tube1,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Qon tahlillari".toString(),
                      style: GoogleFonts.rubik(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 110,
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
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        AppImages.anketa1,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Med Anketa".toString(),
                      style: GoogleFonts.rubik(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  AppBar _appBar(
          {required BuildContext contxt, required Function()? function}) =>
      AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.gray1,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          child: Material(
            color: AppColor.gray1,
            elevation: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: (() => {}),
                      icon: Icon(
                        Icons.menu,
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
                          size: 23,
                          color: AppColor.red4,
                        )),
                  ),
                  IconButton(
                      onPressed: (() => {}),
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
        ),
      );
}
