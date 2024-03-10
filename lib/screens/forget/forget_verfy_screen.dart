import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/blocs/verify/verify_bloc.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../blocs/forget/forget_verfy_bloc.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../widgets/flushbar.dart';
import 'forget_new_password_screen.dart';

Future<dynamic> forgetVerfySheet(BuildContext context, String phone) {
  final _otpPinFiledController = GlobalKey<OtpPinFieldState>();
  var progress=false;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return BlocConsumer<VerifyBloc, VerifyState>(
                listener: (context, state) {
                  if(state is VerifySuccess){
                    setState((){
                      showSuccessFlushBar(state.sendSmsCodeResponse.detail).show(context);

                      progress=false;
                    });
                    forgetnewPassword(context);

                  }
                  else if (state is VerifyFailure){
                    setState((){
                      showErrorFlushBar(state.error).show(context);
                      progress=false;
                    });

                  }
                  else if(state is VerifyLoading){
                    setState((){
                      progress=true;
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
                        SizedBox(height: 40),
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

                            onSubmit: (text) {
                              int otpValue = int.parse(text.toString());
                              print(otpValue);
                              BlocProvider.of<VerifyBloc>(context).add(VerifyButtonPressed(
                                  code: otpValue, phone: phone));
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
                            focusElevation: 0,
                            onPressed: () {
                              int otpValue = int.parse(
                                  _otpPinFiledController.currentState!.text.toString());

                              print(otpValue.toString());
                              if (otpValue.toString().length != 6) {

                                showErrorFlushBar("Kod To`liq Emas");
                              } else {
                                BlocProvider.of<VerifyBloc>(context).add(VerifyButtonPressed(
                                    code: otpValue, phone: phone));
                              }
                            },
                            color: AppColor.red1,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child:  progress?CircularProgressIndicator(color:Colors.white):Text("Tasdiqlash"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
        );
      });
}
