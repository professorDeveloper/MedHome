import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/blocs/forget/forget_verfy_bloc.dart';
import 'package:medhome/blocs/forget/forget_verfy_event.dart';
import 'package:medhome/blocs/forget/forget_verfy_state.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/forget/forget_new_password_screen.dart';
import 'package:medhome/screens/forget/forget_verfy_screen.dart';
import 'package:medhome/utils/app_color.dart';

import '../../utils/app_style.dart';
import '../../widgets/flushbar.dart';
import '../../widgets/widget_text_field.dart';

Future<dynamic> forgotBottomSheet(BuildContext context) {
  TextEditingController controller = TextEditingController();
  bool progress=false;

  return showModalBottomSheet(

      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState)  {
              final MediaQueryData mediaQuery = MediaQuery.of(context);

              return BlocConsumer<ForgetVerfyBloc, ForgetVerfyState>(
              listener: (context, state) {
                if(state is ForgetVerfySuccessState){

                  setState(() {

                    showSuccessFlushBar(state.sendSmsCodeResponse.detail).show(context);
                    progress=false;

                  });
                  forgetVerfySheet(context,controller.text);
                }
                else if (state is ForgetFailure){
                  setState(() {
                    showErrorFlushBar(state.error).show(context);

                    progress=false;
                  });

                }
                else if(state is ForgetVerfyLoading){
                  progress=true;
                  setState(() {
                    progress=true;
                  });

                }

              },
              builder: (context, state) {

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
                        SizedBox(height: 35),
                        Text(
                          "Parolni unutdingizmi ?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: AppColor.textColor,
                          ),
                        ),
                        SizedBox(height: 30),
                        RedTextField(
                          controller: controller,
                          isMaskphone: true,
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
                              BlocProvider.of<ForgetVerfyBloc>(context).add(
                                  ForgetVerfyEvent(phone: controller.text));
                            },
                            color: AppColor.red1,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child:  progress?CircularProgressIndicator(color: Colors.white, ):Text("Ko’dni qabul qilish"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        );
      });
}
