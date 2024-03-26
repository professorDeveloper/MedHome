import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({Key? key, required this.listTileCheckBox}) : super(key: key);
  bool?
      listTileCheckBox; //To access this variable we use widget. in state class below

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Align(
      //Use Align so that our Container does not get all width as it happens in ListView
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.deepPurple.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: AppColor.red4,
              tristate: true,
              value: widget.listTileCheckBox,
              onChanged: (val) {
                setState(() => widget.listTileCheckBox = val);
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                "Tibbiy kartasiz",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textGrayColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
