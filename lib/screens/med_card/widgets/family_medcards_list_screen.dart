import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/screens/med_card/create_medcard_screen.dart';

import '../../../navigator/navigator.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';

class FamilyMedCardsScreen extends StatefulWidget {
  const FamilyMedCardsScreen({super.key});

  @override
  State<FamilyMedCardsScreen> createState() => _FamilyMedCardsScreenState();
}

class _FamilyMedCardsScreenState extends State<FamilyMedCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray1,
        appBar: _appBar(contxt: context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [


              SizedBox(
                height: 15,
              ),
              CustomAnimationsSlide(
                duration: 0.7,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Card(
                    child: Center(
                      child: Container(

                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(

                              decoration: InputDecoration(

                                hintText: "Qidiruv...",
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 15,

                                  fontWeight: FontWeight.w500,
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      openScreen(context, CreateMedCardScreen());
                    },
                    child: CustomAnimationsSlide(
                      duration: 0.7,
                      direction: FadeSlideDirection.btt,

                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        elevation: 1.5,
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 80,
                          width: double.infinity,

                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                child: Image.asset(
                                  AppImages.doctor,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doctor Mehmet A".toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  Text(
                                    "Kim: Akam".toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 124, 124, 124),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 33,
                                width: 57,
                                decoration: BoxDecoration(
                                  color: AppColor.red4,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  size:20,
                                  Icons.person_outlined,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: 10,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
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
                  closeScreen(contxt);
                  print('"asdasdasdasdasdasd');
                },
                icon: Icon(
                  CupertinoIcons.back,
                  size: 30,
                  color: AppColor.textColor,
                )),
            Spacer(),
            SizedBox(
              width: 16,
            ),
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
                  "Mening Oilam".toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 3, right: 10, left: 25),
              child: IconButton(
                  onPressed: (() => {}),
                  icon: Icon(
                    Icons.notifications,
                    size: 25,
                    color: AppColor.red4,
                  )),
            ),
          ]),
    ),
    automaticallyImplyLeading: false,
  );

}
