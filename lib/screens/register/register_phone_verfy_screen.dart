import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/blocs/register/send_sms_code_bloc.dart';
import 'package:medhome/screens/verify/VerifyBottomSheet.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/utils/utils.dart';
import 'package:medhome/widgets/widget_text_field.dart';

class RegisterPhoneVerfyScreen extends StatefulWidget {
  const RegisterPhoneVerfyScreen({super.key});

  @override
  State<RegisterPhoneVerfyScreen> createState() =>
      _RegisterPhoneVerfyScreenState();
}

class _RegisterPhoneVerfyScreenState extends State<RegisterPhoneVerfyScreen> {
  bool isSavable = false;
  bool progress = false;
  var phoneNumberController = TextEditingController();
  late SendSmsCodeBloc bloc;
  bool phoneEmpty = false;
  var errorText = "";

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<SendSmsCodeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<SendSmsCodeBloc, SendSmsCodeState>(
          listener: (context, state) async {
            if (state is SendSmsCodeSuccess) {
              progress = false;
              setState(() {
                Flushbar(
                  titleColor: Colors.green,
                  titleText: Text("Muvaffaqiyatli",
                      style: AppStyle.styleGreen4Sp16W900Zen),
                  messageText: Text(
                    "Telefon raqam Tasdiqlandi",
                    style: AppStyle.styleMainSp14W600Rub,
                  ),
                  margin: EdgeInsets.all(8),
                  flushbarStyle: FlushbarStyle.FLOATING,
                  flushbarPosition: FlushbarPosition.TOP,
                  reverseAnimationCurve: Curves.decelerate,
                  forwardAnimationCurve: Curves.elasticOut,
                  backgroundColor: AppColor.gray1,
                  barBlur: 200,
                  routeBlur: 200,
                  borderRadius: BorderRadius.circular(8),
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 24,
                  ),
                  duration: const Duration(seconds: 3),
                ).show(context);
                verifyBottomSheet(
                    context, convertPhoneNumber(phoneNumberController.text));
              });
              print("${state.response.detail}");
            }
            if (state is SendSmsCodeLoading) {
              progress = true;

              setState(() {});
            }
            if (state is SendSmsCodeFailure) {
              progress = false;
              setState(() {
                Flushbar(
                  titleText:
                  Text("Xato !", style: AppStyle.styleRed4Sp16W900Zen),
                  messageText: Text(
                    state.error,
                    style: AppStyle.styleMainSp14W600Rub,
                  ),
                  margin: EdgeInsets.all(8),
                  flushbarStyle: FlushbarStyle.FLOATING,
                  flushbarPosition: FlushbarPosition.TOP,
                  reverseAnimationCurve: Curves.decelerate,
                  forwardAnimationCurve: Curves.elasticOut,
                  backgroundColor: AppColor.gray1,
                  barBlur: 200,
                  routeBlur: 200,
                  borderRadius: BorderRadius.circular(8),
                  icon: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 24,
                  ),
                  duration: const Duration(seconds: 3),
                ).show(context);
              });
              print(state.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
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
                          bottom: 35,
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
                    topText: "Telefon raqam :",
                    controller: phoneNumberController,
                    isMaskphone: true,

                    isFocused: !progress,
                    hintText: "+998 (97) 977-97-97",
                    prefixIcon: CupertinoIcons.phone,
                    inputType: TextInputType.phone,
                    errorText: phoneEmpty == true ? errorText : null,
                  ),
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
                        SizedBox(
                          width: 10,
                        ),
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
                          "Foydalanish qoidalariga rozi bo’lish",
                          style: GoogleFonts.zenMaruGothic(
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                            color: AppColor.textColor,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: MaterialButton(
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      onPressed: () async {
                        if (phoneNumberController.text.isEmpty) {
                          errorText = "Telfon raqamni kiriting";
                          setState(() {
                            phoneEmpty = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            phoneEmpty = false;
                          });
                        } else {
                          bloc.add(SendSmsCodeButtonPressed(
                              phone: convertPhoneNumber(
                                  phoneNumberController.text)));
                        }
                      },
                      color: AppColor.red1,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: progress
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text("Ko’dni qabul qilish"),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
