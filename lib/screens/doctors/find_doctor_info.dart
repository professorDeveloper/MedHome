import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class FindDoctorDataScreen extends StatefulWidget {
  const FindDoctorDataScreen({super.key});

  @override
  State<FindDoctorDataScreen> createState() => _FindDoctorDataScreenState();
}

class _FindDoctorDataScreenState extends State<FindDoctorDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context),
      body:Column(
        children: [

        ],
      )
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
                },
                icon: Icon(
                  Icons.arrow_back_ios,
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
