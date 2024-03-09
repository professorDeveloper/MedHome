import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/widgets/navigator/navigator.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../blocs/verify/verify_bloc.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../register/register_screen.dart';

class VerifyBottomSheetScreen extends StatefulWidget {
  final String phone;

  const VerifyBottomSheetScreen({Key? key, required this.phone})
      : super(key: key);

  @override
  State<VerifyBottomSheetScreen> createState() =>
      _VerifyBottomSheetScreenState();
}

class _VerifyBottomSheetScreenState extends State<VerifyBottomSheetScreen> {
  bool progress = false;
  final _otpPinFiledController = GlobalKey<OtpPinFieldState>();

  late VerifyBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<VerifyBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyBloc, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          openScreen(context, RegisterScreen(phone: widget.phone));
        }

        if (state is VerifyFailure) {
          progress = false;
          setState(() {
            Flushbar(
              titleText: Text("Xato !", style: AppStyle.styleRed4Sp16W900Zen),
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
        }
        if (state is VerifyLoading) {
          progress = true;
          setState(() {});
        }
      },
      builder: (context, state) {
        final MediaQueryData mediaQuery = MediaQuery.of(context);

        return Padding(
          padding: mediaQuery.viewInsets,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: mediaQuery.size.height * 0.5,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Kodni tasdiqlash",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 50),
                OtpPinField(
                    smsRegex: r'^\d{6}$',
                    onSubmit: (text) {
                      int otpValue = int.parse(text.toString());
                      print(otpValue);
                      bloc.add(VerifyButtonPressed(
                          code: otpValue, phone: widget.phone));
                    },
                    onChange: (text) {},
                    key: _otpPinFiledController,
                    autoFillEnable: false,
                    otpPinFieldStyle: OtpPinFieldStyle(
                        filledFieldBackgroundColor: AppColor.red1,
                        filledFieldBorderColor: AppColor.red1,
                        defaultFieldBackgroundColor: AppColor.red6,
                        activeFieldBorderColor: AppColor.red1,
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColor.white,
                        )),
                    maxLength: 6,
                    fieldWidth: 50,
                    fieldHeight: 60,
                    showDefaultKeyboard: true,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
                SizedBox(
                  height: 40,
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
                      int otpValue = int.parse(
                          _otpPinFiledController.currentState!.text.toString());

                      print(otpValue.toString());
                      if (otpValue.toString().length != 6) {
                        Flushbar(
                            titleText: Text("Xato !",
                                style: AppStyle.styleRed4Sp16W900Zen),
                            messageText: Text(
                              "Kod To`liq Emas",
                            )).show(context);
                      } else {
                        bloc.add(VerifyButtonPressed(
                            code: otpValue, phone: widget.phone));
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
                        : Text("Tasdiqlash"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
