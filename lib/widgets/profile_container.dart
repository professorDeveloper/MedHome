import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';

class StatsContainer extends StatelessWidget {
  final String statText;
  final String statValue;
  const StatsContainer({
    super.key,
    required this.statText,
    required this.statValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 110,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statText,
            style: GoogleFonts.zenMaruGothic(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColor.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            statValue,
            style: GoogleFonts.zenMaruGothic(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColor.red1,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  final String mainText;
  final String? subText;
  final AssetImage image;
  const ProfileInformation(
      {super.key, required this.mainText, this.subText, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11))
      ) ,
      borderOnForeground: true,
      elevation: 1,
      color: Colors.white,

      child: Container(
        height: 100,
        color: Colors.white,
        margin: EdgeInsets.all(8),
        width: double.infinity,
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
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: GoogleFonts.zenMaruGothic(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
