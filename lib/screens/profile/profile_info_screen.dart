import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/animations/custom_animation.dart';
import 'package:medhome/blocs/home/profile/profile_bloc.dart';
import 'package:medhome/core/models/response/home/profile_response.dart';

import '../../blocs/login/login_bloc.dart';
import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/my_pref.dart';
import '../../widgets/flushbar.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() => _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  late ProfileBloc bloc;
  var progress = false;
  late ProfileResponse profileResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ProfileBloc>(context);

    bloc.add(GetProfileEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
  listener: (context, state) async{
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
    if(state is ProfileLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is ProfileSuccess){
      profileResponse=state.sucsess;
      print(profileResponse.fullName);
      print(profileResponse.toString());
      print(profileResponse.jshshr);
          return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: _appBar(contxt: context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAnimationsSlide(
                    duration: 0.7,
                    child: Card(
                      shape: CircleBorder(),
                      color: Colors.white,
                      child:Container(
                        height: 110,
                        width: 110,
                        child: Center(
                          child: Icon(Icons.add,size: 40,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              itemProfileInfo("F. I. SH.",profileResponse.fullName),
              SizedBox(height: 8,),
              itemProfileInfo("Elektron pochta",profileResponse.email.isNotEmpty ? profileResponse.email : "Email kiritilmagan"),
              SizedBox(height: 8,),

              itemProfileInfo("Telefon raqam",profileResponse.phone),
              SizedBox(height: 8,),

              itemProfileInfo("Tug’ilgan sana", profileResponse.age.isEmpty ? 'Tugulgan sana kiritilmagan' : profileResponse.age),
              SizedBox(height: 8,),

              itemProfileInfo("JSHSHIR",profileResponse.jshshr.isEmpty? 'JSHSHIR kiritilmagan': profileResponse.jshshr),
              SizedBox(height: 8,),
              itemProfileInfo("Yashash Manzili","Kiritilmagan"),
              SizedBox(height: 8,),
              itemProfileInfo("Jinsi",profileResponse.gender),
              SizedBox(height: 8,),

            ],
          ),
        ),
      );

    }
    return Scaffold(
      body: Center(
        child:Text("Failed please try again to get"),
      ),
    );
  },
);
  }
  Widget itemProfileInfo(String name,value){
    return CustomAnimationsSlide(
      duration: 0.7,
      direction: FadeSlideDirection.btt,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Text(name,style: GoogleFonts.rubik(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColor.idkTextGrayColor
              ),),
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0,horizontal: 15),
                  child: Text(

                    value,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                      fontSize: 18,
                      fontStyle: FontStyle.normal
                    )
                    ,
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
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
                  "Profil".toString(),
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
                    Icons.edit,
                    size: 23,
                    color: AppColor.red4,
                  )),
            ),
          ]),
    ),
    automaticallyImplyLeading: false,
  );

}
