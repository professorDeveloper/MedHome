import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';

// ignore: must_be_immutable
class AnalysisItem extends StatefulWidget {
  AnalysisItem({
    super.key,
    required this.isVisible,
    required this.title,
    required this.selectType,
    required this.selectedItems,
  });
  String title;
  bool isVisible;
  Function selectType;
  List<String> selectedItems;

  @override
  State<AnalysisItem> createState() => _AnalysisItemState();
}

class _AnalysisItemState extends State<AnalysisItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              widget.selectType(widget.title);
            });
          },
          title: Text(
            widget.title,
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: widget.selectedItems.contains(widget.title)
              ? Icon(
                  Icons.check_circle_rounded,
                  size: 30,
                  color: AppColor.red1,
                )
              : SvgPicture.asset(
                  AppImages.circle,
                  width: 30,
                  height: 30,
                ),
        ),
        Container(
          width: double.infinity,
          height: widget.isVisible ? 3 : 0,
          margin: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
              color: AppColor.containerGrayColor,
              borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}
