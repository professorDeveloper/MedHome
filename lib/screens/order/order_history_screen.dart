import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';

import '../analysis/date_selector.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: AppBar(
        backgroundColor: AppColor.gray1,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Buyurtmalar tarixi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 36,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 78,
          left: 24,
          right: 24,
          bottom: 30,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.containerGrayColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 1,
                  )
                ],
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  DateSelector(
                    isStartDate: true,
                  ),
                  SizedBox(width: 12),
                  DateSelector(
                    isStartDate: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 17),
            Flexible(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '27.01.2024',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            'Ortopediya',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Text(
                            '300,000 UZS',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}