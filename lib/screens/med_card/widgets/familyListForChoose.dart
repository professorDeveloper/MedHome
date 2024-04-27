import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/core/models/request/auth/recieve_password_request.dart';
import 'package:medhome/core/repository/app_repository.dart';
import 'package:medhome/extensions/functions.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/screens/med_card/widgets/family_medcards_list_screen.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/widgets/flushbar.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../blocs/forget/recieve_password_bloc.dart';

Future<dynamic> showChooseList(BuildContext context,) {
  int selectedIndex = -1; // Variable to store the index of the selected item

  return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return BlocConsumer<RecievePasswordBloc, RecievePasswordState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Oilaviy so’rovnoma",
                            style: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: ListView.builder(
                              itemCount: familyChooseList().length,
                              itemBuilder:(BuildContext context, int index) {
                                return CustomAnimationsSlide(
                                  duration: 0.8,
                                  direction: FadeSlideDirection.btt,
                                  child: Card(
                                    elevation: 1.5,
                                    surfaceTintColor: Colors.white,
                                    color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(vertical: 20),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              children: [
                                                Text(
                                                  familyChooseList()[index].title,
                                                  style: GoogleFonts.rubik(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: AppColor.textColor),
                                                ),
                                                Spacer(),
                                                RoundCheckBox(
                                                  borderColor: AppColor.borderColor,
                                                  size: 30,
                                                  checkedColor: Colors.red,
                                                  onTap: (selected) {
                                                    setState(() {
                                                      selectedIndex = index;
                                                    });
                                                  },
                                                  isChecked: selectedIndex == index,
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                );
                              },
                            )),
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
                                  openScreen(context, FamilyMedCardsScreen());
                                },
                                color: AppColor.red1,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Text("Tanlash")),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              );
            });
      });
}
