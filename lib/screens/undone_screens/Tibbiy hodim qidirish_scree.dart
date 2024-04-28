import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/widgets/custom_button.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class TibbiyhodimqidirishScreen extends StatelessWidget {
  const TibbiyhodimqidirishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _users = [
      'Tomir ichiga infeksiya',
      'Tomir ichiga infeksiya Tomir ichiga infeksiya tomchi orqali (Kapelnitsa)',
      'Mushak orasiga infeksiya',
      'Ter orasiga infeksiya',
      'Jarrohlikdan keyingi Jarrohatlarga ishlov berish (Yiringli Jaroxat)',
      'Tozalovchi klizma qo’yish',
      "Puls va Arterial qon bosimni o'lchash",
      'Choklarni olish',
    ];
    return Scaffold(
      appBar: _appBar(contxt: context),
      backgroundColor: AppColor.gray1,
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Narxi: ",
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: AppColor.black,
                    ),
                    children: [
                      TextSpan(
                        text: "0 so’m",
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomButton(
              text: 'Tasdiqlash',
              onPressed: () {},
              radius: 10,
              margin: EdgeInsets.symmetric(horizontal: 0),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Qidiruv".toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Tibbiy Kartani Tanlang".toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: AppColor.textGrayColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add,
                      color: AppColor.red4,
                      size: 38,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tibbiy kartani qo’shing".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColor.red4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Tibbiy kartasiz".toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: AppColor.textGrayColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 165,
                      decoration: BoxDecoration(
                        color: AppColor.red4,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Erkak".toString(),
                          style: GoogleFonts.rubik(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 165,
                      decoration: BoxDecoration(
                        color: AppColor.gray2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Ayol".toString(),
                          style: GoogleFonts.rubik(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Sizning Yosh Guruhingiz".toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: AppColor.textGrayColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bolalar".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: AppColor.textGrayColor,
                      ),
                    ),
                    Text(
                      "16 yoshgacha".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 15,
                        color: AppColor.textGrayColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "0-2 yosh".toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "2-12 yosh".toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "12-16 yosh".toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColor.black,
                      thickness: 1,
                    ),
                    Text(
                      "Kattalar".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: AppColor.textGrayColor,
                      ),
                    ),
                    Text(
                      "16 yoshdan katta".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 15,
                        color: AppColor.textGrayColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 155,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "60 gacha".toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 155,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "60 dan".toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            _users[index].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColor.red4,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: AppColor.black,
                                  size: 18,
                                ),
                                Text(
                                  "0".toString(),
                                  style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.red4,
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: AppColor.black,
                                  size: 18,
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
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
                  margin: EdgeInsets.only(top: 3),
                  child: IconButton(
                      onPressed: (() => {}),
                      icon: Icon(
                        CupertinoIcons.bell_fill,
                        size: 25,
                        color: AppColor.red4,
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );
}
