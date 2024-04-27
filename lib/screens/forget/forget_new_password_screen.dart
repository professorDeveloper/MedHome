import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/core/models/request/auth/recieve_password_request.dart';
import 'package:medhome/extensions/functions.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/widgets/flushbar.dart';

import '../../blocs/forget/recieve_password_bloc.dart';

Future<dynamic> forgetnewPassword(BuildContext context, String phone) {
  bool isPasswordVisible = true;
  bool isPasswordVisible1 = true;
  TextEditingController controllerPassword1 = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();
  bool progress = false;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return BlocConsumer<RecievePasswordBloc, RecievePasswordState>(
                listener: (context, state) {
                  if (state is RecievePasswordSuccess) {
                    setState(() {
                      progress = false;
                    });
                    Navigator.of(context).pop();
                    showSuccessFlushBar("Parol muvaffaqiyatli o'zgartirildi")
                        .show(context);
                  }
                  if (state is RecievePasswordFailure) {
                    setState(() {
                      progress = false;
                    });
                    showErrorFlushBar(state.error).show(context);
                  }

                  if (state is RecievePasswordLoading) {
                    setState(() {
                      progress = true;
                    });
                  }
                },
                builder: (context, state) {
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
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Parolni tiklash",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: AppColor.textColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
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
                                      "Yangi parol :",
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
                                  controller: controllerPassword1,
                                  obscureText: isPasswordVisible1,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: Colors.black,
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
                                          isPasswordVisible1 = !isPasswordVisible1;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          isPasswordVisible1
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
                                    padding:
                                    const EdgeInsets.only(left: 5.0, right: 3),
                                    child: Text(
                                      "Parolingiz  Tasdiqlang:",
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
                                  controller: controllerPassword2,
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
                                          isPasswordVisible = !isPasswordVisible;
                                          setState(() {});
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
                        CustomAnimationsSlide(
                          direction: FadeSlideDirection.btt,
                          duration: 0.8,

                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.all(15),
                            width: double.infinity,
                            child: MaterialButton(
                                elevation: 0,
                                focusElevation: 0,
                                onPressed: () {
                                  if (controllerPassword1.text ==
                                      controllerPassword2.text &&
                                      controllerPassword1.isValidPassword()) {
                                    BlocProvider.of<RecievePasswordBloc>(context).add(
                                        RecievePasswordEvent(
                                            request: RecievePasswordRequest(
                                                password: controllerPassword1.text
                                                    .toString(),
                                                password2: controllerPassword2.text
                                                    .toString(),
                                                phone: phone)));
                                  }
                                },
                                color: AppColor.red1,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: progress
                                    ? CircularProgressIndicator()
                                    : const Text("Parolni o’zgartirish")),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            });
      });
}