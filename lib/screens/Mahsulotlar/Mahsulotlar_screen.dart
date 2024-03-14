import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';

import '../../utils/app_images.dart';

class MahsulotlarScreen extends StatefulWidget {
  const MahsulotlarScreen({super.key});

  @override
  State<MahsulotlarScreen> createState() => _MahsulotlarScreenState();
}

class _MahsulotlarScreenState extends State<MahsulotlarScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(contxt: context, function: () {}),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.red1,
                  ),
                  labelColor: Colors.white,
                  labelStyle: GoogleFonts.zenMaruGothic(
                      fontSize: 18, fontWeight: FontWeight.w900),
                  unselectedLabelColor: Color.fromRGBO(0, 0, 0, 1),
                  tabs: [
                    Tab(
                      text: 'Mahsulotlar',
                    ),
                    Tab(
                      text: 'Dorilar',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Tez Kunda...".toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("kka".toString()),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
