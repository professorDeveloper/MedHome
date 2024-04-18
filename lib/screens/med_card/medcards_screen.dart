import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/screens/med_card/widgets/search_screen.dart';
import 'package:medhome/screens/med_card/widgets/sheet_list.dart';
import 'package:medhome/widgets/custom_button.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class MedCardsScreen extends StatefulWidget {
  const MedCardsScreen({super.key});

  @override
  State<MedCardsScreen> createState() => _MedCardsScreenState();
}

class _MedCardsScreenState extends State<MedCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray1,
        appBar: _appBar(
          contxt: context,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CustomAnimationsSlide(
                duration: 0.7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  borderOnForeground: true,
                  elevation: 1,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      modelBottomSheet(context);
                    },
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              AppImages.tube1,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Qon tahlillari".toString(),
                            style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              CustomAnimationsSlide(
                duration: 0.7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  borderOnForeground: true,
                  elevation: 1,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              AppImages.anketa1,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Med Anketa".toString(),
                            style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "Oilaviy so’rovnoma".toString(),
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20),
                    child: Column(
                      children: [
                        CustomSheetList(
                          text: "Turmush o’rtog’",
                          isCheck: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomSheetList(
                          text: "Ota-ona",
                          isCheck: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomSheetList(
                          text: "Bobo-buvi",
                          isCheck: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomSheetList(
                          text: "Aka-uka",
                          isCheck: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomSheetList(
                          text: "Opa-singil",
                          isCheck: false,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CustomButton(
                          text: "Tasdiqlash",
                          onPressed: () {},
                          radius: 100,
                          margin: EdgeInsets.all(0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
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
                      Icons.menu,
                      size: 30,
                      color: AppColor.textColor,
                    )),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 49,
                        height: 49,
                        child: Image.asset(
                          AppImages.app,
                        )),
                    Text(
                      "Med Home".toString(),
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
                  width: 15,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );
}
