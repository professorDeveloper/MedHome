import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/blocs/register/send_sms_code_bloc.dart';
import 'package:medhome/core/di/get_it.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';
import 'package:medhome/utils/utils.dart';
import 'package:medhome/widgets/widget_text_field.dart';
import 'package:toastification/toastification.dart';

import '../verify/VerifyBottomSheet.dart';

class RegisterPhoneVerfyScreen extends StatefulWidget {
  const RegisterPhoneVerfyScreen({super.key});

  @override
  State<RegisterPhoneVerfyScreen> createState() => _RegisterPhoneVerfyScreenState();
}

class _RegisterPhoneVerfyScreenState extends State<RegisterPhoneVerfyScreen> {
  bool isSavable = false;
  bool progress = false;
  var phoneNumberController = TextEditingController();
  late SendSmsCodeBloc bloc;
  bool phoneEmpty = false;
  var errorText="";
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
                toastification.show(
                  context: context,
                  type: ToastificationType.success,
                  style: ToastificationStyle.flat,
                  autoCloseDuration: const Duration(seconds: 3),
                  title: 'Success',
                  description: 'Muvaffaqiaytli Kiritildi.',
                  alignment: Alignment.topRight,
                  direction: TextDirection.ltr,
                  animationDuration: const Duration(milliseconds: 300),
                  animationBuilder: (context, animation, alignment, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  icon: const Icon(Icons.check),
                  primaryColor: Colors.green,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 16,
                      offset: Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                  onCloseTap: () {
                    // Do something when the toast is closed
                  },
                  showProgressBar: true,
                  closeButtonShowType: CloseButtonShowType.onHover,
                  closeOnClick: false,
                  pauseOnHover: true,
                  dragToClose: true,
                );
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
                toastification.show(
                  context: context,
                  type: ToastificationType.success,
                  style: ToastificationStyle.flat,

                  autoCloseDuration: const Duration(seconds: 3),
                  title: 'Xatolik yuz berdi',
                  description: state.error,
                  alignment: Alignment.topRight,

                  direction: TextDirection.ltr,
                  icon: const Icon(Icons.error),
                  primaryColor: Colors.redAccent,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 16,
                      offset: Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                  onCloseTap: () {
                    toastification.dismissAll();
                     // Do something when the toast is closed
                  },
                  showProgressBar: true,
                  closeOnClick: false,
                  pauseOnHover: true,
                  dragToClose: true,
                );

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
                        bottom: 35, // Adjust this value to control the distance from the bottom
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Ro’yxatdan o’tish", style: AppStyle.styleMainSp29W600Rub),
                        ),
                      ),
                    ],
                  ),
                ),
                RedTextField(
                  topText: "Telefon raqam :",
                  controller: phoneNumberController,
                  isMaskphone: true,
                  hintText: "+998 (97) 977-97-97",
                  prefixIcon: CupertinoIcons.phone,
                  inputType: TextInputType.phone,
                  errorText: phoneEmpty == true
                      ? errorText
                      : null,
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
                    focusElevation: 0,
                    onPressed: ()async {
                      if (phoneNumberController.text.isEmpty) {
                        errorText = "Telfon raqamni kiriting";
                        setState(() {
                          phoneEmpty = true;
                        });
                        await Future.delayed(Duration(seconds: 2));
                        setState(() {
                          phoneEmpty = false;
                        });
                      }
                      else{
                        bloc.add(SendSmsCodeButtonPressed(phone: convertPhoneNumber(phoneNumberController.text)));

                      }
                    },
                    color: AppColor.red1,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: progress?CircularProgressIndicator(color: Colors.white,):Text("Ko’dni qabul qilish") ,
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
