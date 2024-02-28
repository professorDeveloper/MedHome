import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/widgets/widget_text_field.dart';

import '../../utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  bool isSavable=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      child: Image.asset(
                        AppImages.appLogo,
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Text("Kirish", style: AppStyle.styleMainSp29W600Rub),
                    bottom: 50, // Matn pastdagi masofani o'zgartirish
                  ),
                ],
              ),
            ),
            Column(
              children: [
                RedTextField(topText: "Telefon raqam :",hintText: "+998 (97) 977-97-97",prefixIcon: CupertinoIcons.phone,inputType: TextInputType.phone,),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 3),
                            child: Text(
                              "Parolingiz :",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.5,),
                      TextField(
                        obscureText: isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.black,
                        enableInteractiveSelection: true,
                        style: TextStyle(fontSize: 15.5),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(CupertinoIcons.lock!, color: AppColor.red3),
                          ),
                          suffixIcon:
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 16),
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  isPasswordVisible=!isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          hintText: "****************",
                          fillColor: AppColor.red5,
                          filled: true,
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13.5,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: AppColor.red5,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0x62e7344a),
                              width: 2.0,
                            ),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
                        ),
                      ),

                    ],
                  ),
                )              ],
            ),
            SizedBox(height: 5,),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isSavable=!isSavable;

                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 5,),
                        Checkbox(value: isSavable, onChanged:(it) {
                          setState(() {
                            isSavable=!isSavable;

                          });

                        },activeColor: AppColor.red4, focusColor: AppColor.red4, side: BorderSide(
                          color: AppColor.red4
                        ), ),
                      Text("Eslab qolish", style: GoogleFonts.zenMaruGothic(fontWeight: FontWeight.w800,fontSize: 13,color: AppColor.textColor),),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Add your logic for "Forgot Password" action here
                        },
                        child: Text(
                          'Parolni unutdingizmi ?',
                          style: GoogleFonts.zenMaruGothic(
                              fontWeight: FontWeight.w800,fontSize: 13,color: AppColor.textColor                          ),
                        ),
                      ),
                        SizedBox(width: 25,)
                    ],),
                  ),
                  SizedBox(height: 3,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                      'Akkauntingiz yoqmi ?',
                      style: GoogleFonts.zenMaruGothic(
                          fontWeight: FontWeight.w800,fontSize: 14,color: AppColor.textColor                          ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      child: Text(
                        'Ro’yxatdan o’tish ',
                        style: GoogleFonts.zenMaruGothic(
                            fontWeight: FontWeight.w900,fontSize: 14,color: AppColor.red3                          ),
                      ),
                    ),
                  ],)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: MaterialButton(
                elevation: 0,
                  focusElevation: 0,
                  onPressed: () {
                  },
                  color: AppColor.red1,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text("Keyingi")),
            )

          ],
        ),
      ),
    );
  }
}
