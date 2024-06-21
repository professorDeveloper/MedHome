import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/screens/med_card/widgets/family_medcards_list_screen.dart';
import 'package:medhome/screens/med_card/widgets/family_listfor_choose.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../doctors/choose_date_for_consulting_screen.dart';

class CHooseCreateMedcardScreen extends StatefulWidget {
  const CHooseCreateMedcardScreen({super.key});

  @override
  State<CHooseCreateMedcardScreen> createState() => _CHooseCreateMedcardScreenState();
}

class _CHooseCreateMedcardScreenState extends State<CHooseCreateMedcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(height: 200,),

          CustomAnimationsSlide(
            duration: 0.8,
            direction: FadeSlideDirection.btt,

            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 1.5,
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  openScreen(context, CHooseCreateMedcardScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: Center(
                    child: Text("O’zim uchun",style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                      fontSize: 19,
                    ),),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          CustomAnimationsSlide(
            duration: 0.8,
            direction: FadeSlideDirection.btt,

            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 1.5,
              color: Colors.white,
              child: InkWell(
                onTap: () {

                  showChooseList(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: Center(
                    child: Text("Oilam uchun",style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                      fontSize: 19,
                    ),),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
      appBar: _appBar(contxt: context),
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

}
