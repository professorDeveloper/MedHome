import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../animations/custom_animation.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class CreateMedCardScreen extends StatefulWidget {
  const CreateMedCardScreen({super.key});

  @override
  State<CreateMedCardScreen> createState() => _CreateMedCardScreenState();
}

class _CreateMedCardScreenState extends State<CreateMedCardScreen> {
  String gender = "MALE";
  int selectedCardIndex = 0; // Initialize with an index that doesn't exist
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
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

            },
            color: AppColor.red1,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text("Yaratish"),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: _appBar(contxt: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Oilam Uchun",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color(0xff5B5B5B)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 20,
            ),
            customCardTextField("F.I.SH", "Ism Familiya", TextEditingController(),TextInputType.name),

            SizedBox(
              height: 12,
            ),
            customCardTextField("Elektron pochta", "example@gmail.com", TextEditingController(),TextInputType.emailAddress),
            SizedBox(
              height: 12,
            ),
            customCardTextField("Telefon raqam", "+998 (99) 998 88 88", TextEditingController(),TextInputType.phone,isMask: true),
            SizedBox(
              height: 12,
            ),
            customCardTextField("Tug’ilgan sana", "20.02.2002", TextEditingController(),TextInputType.datetime),
            SizedBox(
              height: 12,
            ),
            customCardTextField("JSHSHIR", "12345678", TextEditingController(),TextInputType.number),
            SizedBox(
              height: 12,
            ),
            customCardTextField("Yashash Manzili", "Toshkent shahar, Chiloonsor tumani", TextEditingController(),TextInputType.number),


          ],
        ),
      ),
    );
  }

  Widget customCardTextField(
      String name, hint, TextEditingController controller,TextInputType type,{ bool isMask =false}) {
    return CustomAnimationsSlide(
      duration: 0.7,
      direction: FadeSlideDirection.btt,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Text(
                name,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.idkTextGrayColor),
              ),
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Container(
                  width: double.infinity,
                  child: TextField(
                      inputFormatters: isMask! ? [maskFormatter] : [],
                      keyboardType: type,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                              color: AppColor.idkTextGrayColor,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                          hintText: hint,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 15.5),

                      ),
                      controller: controller,
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: AppColor.textColor,
                          fontSize: 16,
                          fontStyle: FontStyle.normal))),
              margin: EdgeInsets.symmetric(vertical: 8),

            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext contxt}) => AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        toolbarHeight: 60,
        backgroundColor: Colors.grey.shade200,
        titleSpacing: 0,
        title: Container(
          width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(contxt).openDrawer();
                      Scaffold.of(context).openDrawer();
                      print('"asdasdasdasdasdasd');
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 28,
                      color: AppColor.textColor,
                    )),
                Spacer(),
                SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tibbiy kartani yaratish".toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: IconButton(
                      onPressed: (() => {}),
                      icon: Icon(
                        CupertinoIcons.bell_fill,
                        size: 25,
                        color: AppColor.red4,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );

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
}
