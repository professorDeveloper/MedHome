import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../profile/profile_screen.dart';

class SearchingResultScreen extends StatefulWidget {
  const SearchingResultScreen({super.key});

  @override
  State<SearchingResultScreen> createState() => _SearchingResultScreenState();
}

class _SearchingResultScreenState extends State<SearchingResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

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
