import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(left: 25,top: 15),
              child: Text("Buyurtmalar",style: GoogleFonts.rubik(fontWeight:FontWeight.w500,fontSize: 20,color: AppColor.textColor)),

            ),
            SizedBox(height: 12,),
            customOrderItem(),

          ],
        ),
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
                        size: 23,
                        color: AppColor.red4,
                      )),
                ),
                IconButton(
                    onPressed: (() => {
                      openScreen(context, MyProfile())
                    }),
                    icon: Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 27,
                      color: AppColor.red4,
                    )),
                SizedBox(width: 5,),

              ]),
        ),

        automaticallyImplyLeading: false,
      );

  Card customOrderItem(){
    return Card(
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
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bemor",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.textColor),),
              )
            ],
          )
        ),
      ),
    );

  }
}
