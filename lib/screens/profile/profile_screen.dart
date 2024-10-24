import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/profile/profile_info_screen.dart';
import 'package:medhome/widgets/navigator/navigator.dart';

import '../../animations/custom_animation.dart';
import '../../blocs/home/profile/profile_bloc.dart';
import '../../core/models/response/home/profile_response.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../widgets/flushbar.dart';
import '../../widgets/profile_container.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ProfileBloc profileBloc;
  late ProfileResponse profileResponse;
  @override
  void initState() {
    profileBloc = BlocProvider.of<ProfileBloc>(context);

    profileBloc.add(GetProfileEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: _appBar(contxt: context),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            profileResponse=state.sucsess;
          }
          if (state is ProfileLoading) {
            setState(() {});
          }
          if (state is ProfileFailure) {
            setState(() {
              showErrorFlushBar(
                state.error,
              ).show(context);
            });
            print(state.error);
          }

        },
        builder: (context, state) {
          if(state is ProfileSuccess){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: CustomAnimationsSlide(
                          direction: FadeSlideDirection.ltr,
                          duration: 0.5,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAnimationsSlide(
                              duration: 0.5,
                              child: Text(
                                state.sucsess.fullName,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CustomAnimationsSlide(
                      direction: FadeSlideDirection.ltr,
                      duration: 0.7,
                      child: CustomAnimationsSlide(
                        duration: 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatsContainer(
                              statText: 'Bo’y :',
                              statValue: '1.80 m',
                            ),
                            StatsContainer(
                              statText: 'Vazn :',
                              statValue: '58 Kg',
                            ),
                            StatsContainer(
                              statText: 'BMI :',
                              statValue: 'Good',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAnimationsSlide(
                          duration: 0.8,
                          child: InkWell(
                            onTap: () {
                              openScreen(context, ProfileInformationScreen());
                            },
                            child: ProfileInformation(
                              mainText: "Shaxsiy ma’lumotlar",
                              image: AssetImage("assets/images/avatar.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomAnimationsSlide(
                          duration: 0.9,
                          child: ProfileInformation(
                            mainText: "Saralangan",
                            image: AssetImage("assets/images/star.png"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomAnimationsSlide(
                          duration: 1,
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                        AssetImage("assets/images/family.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "Oilaviy anketalar",
                                          style: GoogleFonts.zenMaruGothic(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: AppColor.black,
                                          ),
                                        ),
                                        Text(
                                          "1 oila a’zosi mavjud",
                                          style: GoogleFonts.zenMaruGothic(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomAnimationsSlide(
                          duration: 1.1,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            child: MaterialButton(
                              elevation: 0,
                              highlightElevation: 0,
                              focusElevation: 0,
                              onPressed: () async {},
                              color: AppColor.red1,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Text("Profildan Chiqish"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          }
          if(state is ProfileLoading){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child:Text("Failed please try again to get"),
            ),
          );

        },
      ),
    );
  }

  AppBar _appBar({required BuildContext contxt}) =>
      AppBar(
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
                  width: 10,
                ),
              ]),
        ),
        automaticallyImplyLeading: false,
      );
}
