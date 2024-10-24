import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/blocs/login/login_bloc.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/home/home_screen.dart';
import 'package:medhome/screens/main/main_screen.dart';
import 'package:medhome/screens/register/register_phone_verfy_screen.dart';
import 'package:medhome/utils/my_pref.dart';
import 'package:medhome/utils/utils.dart';
import 'package:medhome/widgets/flushbar.dart';
import 'package:shake/shake.dart';

import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../widgets/widget_text_field.dart';
import '../forget/forget_screen_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var progress = false;
  late LoginBloc bloc;
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isSavable = true;
  var errorTextPhone = "";
  bool phoneEmpty = false;

  var errorTextPassword = "";
  bool passwordEmpty = false;


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            progress = false;
            setState(() {
              showSuccessFlushBar("Login muvaffaqiyatli amalga oshirildi")
                  .show(context);
            });
            Prefs.init();

            await Prefs.setAccessToken(state.sucsess.access);
            await Prefs.setRefreshToken(state.sucsess.refresh);
            openScreen(context, MainScreen());
          }
          if (state is LoginLoading) {
            progress = true;
            setState(() {});
          }
          if (state is LoginFailure) {
            progress = false;
            setState(() {
              showErrorFlushBar(
                state.error,
              ).show(context);
            });
            print(state.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomAnimationsSlide(
                  duration: 0.8,
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Image.asset(
                              'assets/images/app_logo.png',
                              fit: BoxFit.fill,
                              height: 280,
                              width: 280,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Kirish",
                                style: AppStyle.styleMainSp29W600Rub),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomAnimationsSlide(
                  duration: 0.8,
                  direction: FadeSlideDirection.ltr,

                  child: Column(
                    children: [
                      Column(
                        children: [
                          RedTextField(
                            isMaskphone: true,
                            controller: phoneNumberController,
                            topText: "Telefon raqam :",
                            hintText: "+998 (97) 977-97-97",
                            prefixIcon: CupertinoIcons.phone,
                            inputType: TextInputType.phone,
                            errorText:
                                phoneEmpty == true ? errorTextPhone : null,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 3),
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
                              controller: passwordController,
                              obscureText: isPasswordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: Colors.black,
                              enableInteractiveSelection: true,
                              style: TextStyle(fontSize: 15.5),
                              decoration: InputDecoration(
                                errorText:
                                    passwordEmpty ? errorTextPassword : null,
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Color(0x62e7344a),
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Color(0x62e7344a),
                                    width: 2.0,
                                  ),
                                ),
                                prefixIcon: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(CupertinoIcons.lock,
                                      color: AppColor.red3),
                                ),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible =
                                            !isPasswordVisible;
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
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 18.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                CustomAnimationsSlide(
                  duration: 0.8,
                  direction: FadeSlideDirection.btt,

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
                                hoverColor: AppColor.red3,
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
                              onTap: () {
                                openScreen(
                                    context, RegisterPhoneVerfyScreen());
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
                SizedBox(height: 10),
                CustomAnimationsSlide(
                  direction: FadeSlideDirection.btt,
                  duration: 0.8,
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: MaterialButton(
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      onPressed: () async {
                        if (phoneNumberController.text.isEmpty) {
                          errorTextPhone = "Telfon raqamni kiriting";
                          setState(() {
                            phoneEmpty = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            phoneEmpty = false;
                          });
                        } else if (passwordController.text.isEmpty) {
                          errorTextPassword = "Parolni kiriting";

                          setState(() {
                            passwordEmpty = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            passwordEmpty = false;
                          });
                        } else {
                          bloc.add(LoginButtonPressed(
                              phone: convertPhoneNumber(
                                  phoneNumberController.text),
                              password: passwordController.text));
                        }
                      },
                      color: AppColor.red1,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: progress
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Akkauntga kirish"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
