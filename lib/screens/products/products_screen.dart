import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../profile/profile_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(contxt: context, ),
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
      {required BuildContext contxt}) =>
      AppBar(
        elevation:0,

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
                SizedBox(width: 5,),
                IconButton(
                    onPressed: (){
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
}
