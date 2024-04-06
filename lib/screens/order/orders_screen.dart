import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/profile/profile_screen.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(contxt: context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text("Buyurtmalar",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColor.textColor)),
            ),
            SizedBox(
              height: 10,
            ),
            customOrderItem(),
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
                        size: 25,
                        color: AppColor.red4,
                      )),
                ),
                SizedBox(width: 20,),


              ]),
        ),
        automaticallyImplyLeading: false,
      );

  Card customOrderItem() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11))),
      borderOnForeground: true,
      shadowColor: AppColor.gray2,
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      color: Colors.white,
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Text(
                  "Bemor",
                  style: GoogleFonts.rubik(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        AppImages.icContact,
                        height: 34,
                        width: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ism Familiya Otchestvo",
                        style: GoogleFonts.rubik(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.gray2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      columnText("Hizmat Turi", "Kardiolog"),
                      SizedBox(
                        height: 10,
                      ),
                      columnText("Manzil", "Toshkent shahar Chilonzor tumani"),
                      SizedBox(
                        height: 10,
                      ),
                      columnText("Narx", "200 000 so’m"),
                      SizedBox(
                        height: 10,
                      ),
                      columnText("Shifokor", "Ism Familiya Otchestvo"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    elevation: 0,
                    highlightElevation: 0,
                    focusElevation: 0,
                    onPressed: () async {},
                    color: AppColor.red1,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text("Bekor Qilish"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )),
    );
  }

  Widget columnText(String topText, String mainText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(topText,
              style: GoogleFonts.rubik(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5B5B5B))),
        ),
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(mainText,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black)),
        ),
      ],
    );
  }
}
