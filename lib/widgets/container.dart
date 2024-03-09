import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(11))
      ) ,
      borderOnForeground: true,
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      color: Colors.white,
      child: InkWell(
        onTap: (){
          print('asdasd');
        },
        borderRadius: BorderRadius.all(Radius.circular(11)),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Center(
            child: Text(text,
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }
}
