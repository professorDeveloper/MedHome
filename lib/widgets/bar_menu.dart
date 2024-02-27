import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medhome/widgets/container.dart';

class BarMenu extends StatelessWidget {
  const BarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Colors.black,
            ),
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                "assets/svg/setting.svg",
                height: 30,
                width: 30,
              ),
            ),
          ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/appbar_logo.png"),
                height: 60,
                width: 60,
              ),
              Text("Nur",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          )),
      body: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+998 (99) 998 88 88",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.5,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              CustomContainer(text: "To’lov turi"),
              SizedBox(
                height: 30,
              ),
              CustomContainer(text: "Buyurtmalar tarixi"),
              SizedBox(
                height: 30,
              ),
              CustomContainer(text: "Qo’llab quvvatlash"),
              SizedBox(
                height: 30,
              ),
              CustomContainer(text: "Ilova haqida"),
            ],
          ),

          // bottom container
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomContainer(
                  text: "Fikr qoldiring",
                )),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
