import 'package:flutter/material.dart';
import 'package:medhome/utils/app_color.dart';

class BuyurtmalarScreen extends StatelessWidget {
  const BuyurtmalarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: AppBar(
        backgroundColor: AppColor.gray1,
        title: Text('Buyurtmalar'),
      ),
      body: Center(
        child: Text('Buyurtmalar'),
      ),
    );
  }
}
