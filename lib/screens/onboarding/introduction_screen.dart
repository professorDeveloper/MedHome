import 'package:flutter/material.dart';
import 'package:medhome/navigator/navigator.dart';
import 'package:medhome/resources/onboarding/model_contents.dart';
import 'package:medhome/screens/login/login_screen.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:medhome/utils/app_style.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, i) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),    if (i == 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(

                                    margin: const EdgeInsets.only(right: 10,top: 14),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const Row(
                                        children: [
                                          Text(
                                            "O’zbekcha",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          // icon
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),




                        Image.asset(
                          contents[i].image,
                          height: 314,
                          width: 430,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          width: 375,
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: AppStyle.styleMainSp16W600Rub,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: 328,
                          child: Text(
                            contents[i].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    openScreen(context, LoginScreen());
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                color: AppColor.red1,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: currentIndex == contents.length - 1
                    ? const Text("Boshlash")
                    : const Text("Keyingisi")),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: currentIndex == index
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 231, 52, 73),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.red5,
            ),
    );
  }
}
