import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/custom_button.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Narxi: 500 000 so’m".toString(),
            style: GoogleFonts.rubik(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
          CustomButton(
            text: 'Keyingisi',
            onPressed: () {}, radius: null,
          )
        ],
      ),
    );
  }
}
