import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/blocs/register/register_bloc.dart';
import 'package:medhome/extensions/functions.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/home/home_screen.dart';
import 'package:medhome/utils/my_pref.dart';
import 'package:medhome/widgets/flushbar.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/app_style.dart';
import '../../widgets/widget_text_field.dart';

class RegisterScreen extends StatefulWidget {
  final String phone;

  const RegisterScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedCardIndex = 0; // Initialize with an index that doesn't exist
  bool isPasswordVisible = true;
  bool isPasswordVisible2 = true;
  bool checkTwoPasswordSame = false;
  late RegisterBloc bloc;

  String gender = "MALE";
  var nameController = TextEditingController();
  var password1 = TextEditingController();
  var password2 = TextEditingController();
  bool progress = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<RegisterBloc>(context);
  }

  void selectCard(int index) {
    setState(() {
      if (selectedCardIndex == index) {
        // Keep the card selected when tapped again
        selectedCardIndex = index;
      } else {
        selectedCardIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            setState(() {
              progress = false;
            });
            Prefs.setAccessToken(state.response.accessToken.toString());
            Prefs.setRefreshToken(state.response.refreshToken.toString());
            openReplaceScreen(context, HomeScreen());
          }
          if (state is RegisterFailure) {
            setState(() {
              progress = false;
              showErrorFlushBar(state.error).show(context);
            });
          }
          if (state is RegisterLoading) {
            progress = true;

            setState(() {});
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Image.asset(
                          AppImages.appLogo,
                          fit: BoxFit.fill,
                          height: 270,
                          width: 270,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      // Adjust this value to control the distance from the bottom
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Ro’yxatdan o’tish",
                            style: AppStyle.styleMainSp29W600Rub),
                      ),
                    ),
                  ],
                ),
              ),
              RedTextField(
                topText: "To`liq ism :",
                controller: nameController,
                inputAction: TextInputAction.next,
                hintText: "Ism Va Familya",
                prefixIcon: CupertinoIcons.person,
                inputType: TextInputType.name,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 80, // Adjust the height as needed
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Jins :",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCard(0, "Erkak", AppImages.icMale),
                            // Add more cards as needed
                            buildCard(1, "Ayol", AppImages.icFemale),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
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
                    SizedBox(height: 5.5),
                    Builder(builder: (context) {
                      return TextField(
                        obscureText: isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.black,
                        enableInteractiveSelection: true,
                        controller: password1,
                        style: TextStyle(fontSize: 15.5),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child:
                                Icon(CupertinoIcons.lock, color: AppColor.red3),
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
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                            "Parolingizni tasdiqlang :",
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
                      obscureText: isPasswordVisible2,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                      controller: password2,
                      enableInteractiveSelection: true,
                      style: TextStyle(fontSize: 15.5),
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child:
                              Icon(CupertinoIcons.lock, color: AppColor.red3),
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible2 = !isPasswordVisible2;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible2
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  onPressed: () {
                    if (nameController.isValidName() &&
                        password1.isValidPassword() &&
                        password1.text == password2.text) {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      bloc.add(RegisterButtonPressed(
                          fullName: nameController.text,
                          gender: gender,
                          phone: widget.phone,
                          password: password1.text,
                          password2: password2.text));
                    } else if (!nameController.isValidName()) {
                      showErrorFlushBar("Ism va Familyani kiriting")
                          .show(context);
                    } else if (!password1.isValidPassword()) {
                      showErrorFlushBar(
                              "Parol katta kichik Harf va 6 tadan ko`p bo`lishi kerak")
                          .show(context);
                    } else if (password1.text != password2.text) {
                      showErrorFlushBar("Parolni tasdiqlang").show(context);
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
                      : Text(
                          "Ro’yxatdan o’tish",
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget buildCard(int index, String title, String iconAsset) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("Card $index selected!");
        if (index == 0) {
          gender = "MALE";
        } else {
          gender = "FEMALE";
        }
        selectCard(index);
      },
      child: Container(
        height: 50,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              SvgPicture.asset(iconAsset, height: 35, width: 35),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                    color: index == selectedCardIndex
                        ? AppColor.white
                        : Colors.black),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: selectedCardIndex == index ? AppColor.red4 : Color(0xffE7EDF9),
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? Radius.circular(10) : Radius.circular(0),
            bottomLeft: index == 0 ? Radius.circular(10) : Radius.circular(0),
            topRight: index == 1 ? Radius.circular(10) : Radius.circular(0),
            bottomRight: index == 1 ? Radius.circular(10) : Radius.circular(0),
          ),
        ),
      ),
    );
  }
}
