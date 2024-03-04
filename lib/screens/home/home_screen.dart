import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(contxt: context, function: (){
      }),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Center(child: Text("Xizmatlar",style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),),
              decoration: BoxDecoration(
                color:AppColor.red6,
                borderRadius: BorderRadius.circular(23)
              ),
            )
          ],
        ),
      ),
    );
  }
  AppBar _appBar({required BuildContext contxt,  required Function()? function}) =>
      AppBar(
        backgroundColor: AppColor.gray1,
        automaticallyImplyLeading: false,

        title: Material(
          color: AppColor.gray1,
          elevation: 0,
          child: Row(children: [
            IconButton(
                onPressed: (() => {

                }),
                icon:Icon(Icons.menu,size: 30,color: AppColor.textColor,)),

            Spacer(),
            SizedBox(width: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 49,
                    height: 49,
                    child: Image.asset(AppImages.app,)),
                Text(
                  "Med Home".toString(),
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ],
            ),
            Spacer(),
            IconButton(

               onPressed: (() => {

                }),
                icon:Icon(CupertinoIcons.bell_fill,size: 25,color:AppColor.red4,)),
            IconButton(
                onPressed: (() => {

                }),
                icon:Icon(CupertinoIcons.person_alt_circle,size: 30, color:AppColor.red4,)),
          ]),
        ),
      );

}
