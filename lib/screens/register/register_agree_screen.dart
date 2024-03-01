import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_images.dart';
import '../../utils/app_style.dart';
import '../../widgets/widget_text_field.dart';

class RegisterAgreeScreen extends StatefulWidget {
  const RegisterAgreeScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAgreeScreen> createState() => _RegisterAgreeScreenState();
}

class _RegisterAgreeScreenState extends State<RegisterAgreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  bottom: 60,
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
                RedTextField(
                  topText: "To`liq ism :",
                  hintText: "Ism Va Familya",
                  prefixIcon: CupertinoIcons.person,
                  inputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 10,
                ),
                // ItemSelector(
                //   direction: Direction.horizontal,
                //   activeBackgroundColor: AppColor.red1,
                //   inactiveBackgroundColor: Colors.grey[300],
                //   itemMargin: const EdgeInsets.all(10.0),
                //   itemPadding: const EdgeInsets.all(4.0),
                //   itemBorderRadius:
                //       const BorderRadius.all(Radius.circular(5.0)),
                //   itemsCount: 2,
                //   // should be <= items.length
                //   items: const [
                //     Row(
                //       children: [
                //         Container("")
                //       ],
                //     )
                //   ],
                //   // any arbitrary widget list
                //   onSelected: (index) {
                //     // you can access selected item index here!
                //     print(index);
                //   },
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
