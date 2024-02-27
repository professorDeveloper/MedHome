import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medhome/utils/app_images.dart';
import 'package:medhome/utils/app_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics:  const  BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Stack(

              children: [
                // Container(child: Image.asset(AppImages.appLogo)),
                Positioned(bottom: 10,child: Center(child: Text("Kirish",style: AppStyle.styleMainSp29W600Rub,)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
