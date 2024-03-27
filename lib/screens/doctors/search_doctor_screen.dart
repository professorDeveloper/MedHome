import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../order/orders_screen.dart';
import '../profile/profile_screen.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  bool isSavable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context),
      backgroundColor: AppColor.gray1,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 6,),
            Row(
              children: [
                Spacer(),
                Text("Qidiruv",style: GoogleFonts.rubik(
                    fontSize: 18,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500
                ),),
                Spacer(),

              ],
            ),
            SizedBox(height: 22,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerLeft,
              child: Text("Tibbiy Kartani Tanlang",
              style: GoogleFonts.rubik(
                fontSize: 15,
                color: AppColor.textColor,
                fontWeight: FontWeight.w400
              ),),
            ),
            SizedBox(height: 12,),

        Card(
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(11))
          ) ,
          borderOnForeground: true,
          elevation: 1,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          color: Colors.white,
          child: InkWell(
            onTap: (){
              print('asdasd');

            },
            borderRadius: BorderRadius.all(Radius.circular(11)),
            child: Container(
              height: 62,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.add,color:AppColor.red1,size: 30,),
                  SizedBox(width: 10,),

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
            GestureDetector(
              onTap: () {
                setState(() {
                  isSavable = !isSavable;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: isSavable,
                    onChanged: (it) {
                      setState(() {
                      });
                    },
                    activeColor: AppColor.red4,
                    focusColor: AppColor.red4,
                    side: BorderSide(color: AppColor.red4),
                  ),
                  Text(
                    "Foydalanish qoidalariga rozi bo’lish",
                    style: GoogleFonts.zenMaruGothic(
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      color: AppColor.textColor,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: MaterialButton(
                elevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                onPressed: () async {
                  openScreen(context, OrdersScreen());
                },
                color: AppColor.red1,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Ko’dni qabul qilish"),
              ),
            ),

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
