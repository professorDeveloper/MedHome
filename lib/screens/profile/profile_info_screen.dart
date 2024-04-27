import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() => _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: _appBar(contxt: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAnimationsSlide(
                  duration: 0.7,
                  child: Card(
                    shape: CircleBorder(),
                    color: Colors.white,
                    child:Container(
                      height: 110,
                      width: 110,
                      child: Center(
                        child: Icon(Icons.add,size: 40,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            itemProfileInfo("F. I. SH.","Ism Familiya"),
            SizedBox(height: 8,),
            itemProfileInfo("Elektron pochta","example@gmail.com"),
            SizedBox(height: 8,),

            itemProfileInfo("Telefon raqam","+998 (99) 998 88 88"),
            SizedBox(height: 8,),

            itemProfileInfo("Tug’ilgan sana","20.02.2002"),
            SizedBox(height: 8,),

            itemProfileInfo("JSHSHIR","12345678"),
            SizedBox(height: 8,),
            itemProfileInfo("Yashash Manzili","Toshkent shahar, Chiloonsor tumani"),
            SizedBox(height: 8,),

          ],
        ),
      ),
    );
  }
  Widget itemProfileInfo(String name,value){
    return CustomAnimationsSlide(
      duration: 0.7,
      direction: FadeSlideDirection.btt,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Text(name,style: GoogleFonts.rubik(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColor.idkTextGrayColor
              ),),
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0,horizontal: 15),
                  child: Text(

                    value,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                      fontSize: 18,
                      fontStyle: FontStyle.normal
                    )
                    ,
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
            )
          ],
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
                  "Profil".toString(),
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
                    Icons.edit,
                    size: 23,
                    color: AppColor.red4,
                  )),
            ),
          ]),
    ),
    automaticallyImplyLeading: false,
  );

}
