import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/register/phone_input_screen.dart';
import 'package:medhome/screens/register/register_agree_screen.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/widgets/widget_text_field.dart';

import '../../utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late AnimationController _textField1Controller;
  late Animation<Offset> _textField1SlideAnimation;
  late AnimationController _textField2Controller;
  late Animation<Offset> _textField2SlideAnimation;

  bool isPasswordVisible = true;
  bool isSavable = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _textField1Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _textField1SlideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textField1Controller,
      curve: Curves.easeInOut,
    ));

    _textField2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _textField2SlideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textField2Controller,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
    _textField1Controller.forward();
    _textField2Controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
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
                        child: Text("Kirish",
                            style: AppStyle.styleMainSp29W600Rub),
                        bottom: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _textField1SlideAnimation,
                    child: RedTextField(
                      topText: "Telefon raqam :",
                      hintText: "+998 (97) 977-97-97",
                      prefixIcon: CupertinoIcons.phone,
                      inputType: TextInputType.phone,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _textField2SlideAnimation,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, right: 3),
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
                          SizedBox(height: 5.5),
                          TextField(
                            obscureText: isPasswordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            enableInteractiveSelection: true,
                            style: TextStyle(fontSize: 15.5),
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(CupertinoIcons.lock,
                                    color: AppColor.red3),
                              ),
                              suffixIcon: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 18.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  child: Column(
                    children: [
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
                            SizedBox(width: 5),
                            Checkbox(
                              value: isSavable,
                              onChanged: (it) {
                                setState(() {
                                  isSavable = !isSavable;
                                });
                              },
                              activeColor: AppColor.red4,
                              focusColor: AppColor.red4,
                              side: BorderSide(color: AppColor.red4),
                            ),
                            Text(
                              "Eslab qolish",
                              style: GoogleFonts.zenMaruGothic(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: AppColor.textColor,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              hoverColor:AppColor.red3,
                              onTap: () {
                                forgotBottomSheet(context);
                              },
                              child: Text(
                                'Parolni unutdingizmi ?',
                                style: GoogleFonts.zenMaruGothic(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: AppColor.textColor,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Akkauntingiz yoqmi ?',
                            style: GoogleFonts.zenMaruGothic(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: AppColor.textColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: (){
                              openScreen(context, RegisterScreen());
                            },
                            child: Text(
                              'Ro’yxatdan o’tish ',
                              style: GoogleFonts.zenMaruGothic(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: AppColor.red3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: MaterialButton(
                    elevation: 0,
                    focusElevation: 0,
                    onPressed: () {
                      openScreen(context, PhoneInputScreen());
                    },
                    color: AppColor.red1,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text("Akkauntga kirish"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 16,
                color: Colors.green, // Set the color for Container 1
              ),
            ),
            Expanded(
              child: Container(
                height: 16,
                color: Colors.red, // Set the color for Container 2
              ),
            ),
          ],
        )
        ],
        ),
      ),
    );
  }

  Future<dynamic> forgotBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: 450,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Parolni unutdingizmi ?",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w600,
                    fontSize: 29,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 50),
                RedTextField(
                  topText: "Telefon raqam :",
                  hintText: "+998 (97) 977-97-97",
                  prefixIcon: CupertinoIcons.phone,
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: MaterialButton(
                    elevation: 0,
                    focusElevation: 0,
                    onPressed: () {
                      // New Forgot Logic
                    },
                    color: AppColor.red1,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text("Akkauntga kirish"),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textField1Controller.dispose();
    _textField2Controller.dispose();
    super.dispose();
  }
}
