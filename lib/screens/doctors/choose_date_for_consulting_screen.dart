import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/screens/doctors/search_doctor_screen.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/widgets/navigator/navigator.dart';

Future<dynamic> chooseDateForConsulting(BuildContext context) {
  DateTime _selectedDate = DateTime.now();
  Duration _selectedTime = Duration();
  int _showDatePicker = 0;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _showDatePicker == 1
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _showDatePicker = 0;
                                });
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Colors.black,
                              ))
                          : IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Colors.black,
                              )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _showDatePicker == 0
                            ? "Kerakli sanani tanlang"
                            : "Kerakli vaqtni tanlang",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: AppColor.textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _showDatePicker == 0
                      ? SizedBox(
                          width: double.infinity,
                          height: 200, // Adjust the height as needed
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            minimumDate: DateTime.now(),
                            maximumDate: DateTime(2030),
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                _selectedDate = newDate;
                              });
                            },
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 200, // Adjust the height as needed
                          child: CupertinoTimerPicker(
                            minuteInterval: 30,
                            initialTimerDuration: Duration(minutes: 0,hours: 1),
                            mode: CupertinoTimerPickerMode.hm,
                            onTimerDurationChanged: (Duration newTime) {
                              setState(() {
                                _selectedTime = newTime;
                              });
                            },
                          ),
                        ),
                  SizedBox(height: 10),
                  Text(
                    _showDatePicker == 0
                        ? "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} Sana"
                        : "${_selectedTime.toString().substring(0, 4)} Vaqt",
                    style: GoogleFonts.rubik(
                        fontSize: 16, color: AppColor.textColor),
                  ),
                  SizedBox(height: 5),
                  CustomAnimationsSlide(
                    direction: FadeSlideDirection.btt,
                    duration: 0.7,
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: MaterialButton(
                        elevation: 0,
                        highlightElevation: 0,
                        focusElevation: 0,
                        onPressed: () async {
                          if (_showDatePicker == 0) {
                            _showDatePicker = 1;
                            setState(() {});
                          } else {
                            openScreen(context, SearchDoctorScreen());
                          }
                        },
                        color: AppColor.red1,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Text("Tasdiqlash"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
