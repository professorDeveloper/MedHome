import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

import '../../utils/app_images.dart';
import '../../utils/app_style.dart';
import '../../widgets/widget_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late int selectedItemIndex;

  @override
  void initState() {
    super.initState();
    selectedItemIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    double screenHalfWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      child: Image.asset(
                        AppImages.appLogo,
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Text("Ro’yxatdan o’tish",
                        style: AppStyle.styleMainSp29W600Rub),
                    bottom: 65,
                  ),

                ],
              ),
            ),
            RedTextField(
              topText: "To`liq ism :",
              hintText: "Ism Va Familya",
              prefixIcon: CupertinoIcons.person,
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width:double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 80, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItemIndex = index;
                      });

                      // Notify the parent widget about the selected item
                    },
                    child: Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                                height: 30,
                                child: index==0?SvgPicture.asset(AppImages.man):SvgPicture.asset(AppImages.woman)),
                      
                            Text(
                              index==0?"Erkak":"Ayol",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
