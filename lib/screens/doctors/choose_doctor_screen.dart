import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigator/navigator.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../widgets/search_field.dart';
import '../profile/profile_screen.dart';
import 'choose_date_for_consulting_screen.dart';

class ChooseDoctorScreen extends StatefulWidget {
  const ChooseDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDoctorScreen> createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the animation when the screen is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(context),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.0, -50 * (1 - _animation.value)),
                child: Opacity(
                  opacity: _animation.value,
                  child: CustomSearchBar(
                    controller: TextEditingController(),
                    hintText: 'Search',
                    backgroundColor: Colors.white,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Card(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    borderOnForeground: true,
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    color: Colors.white,
                    child: InkWell(
                      onTap: (){
                        chooseDateForConsulting(context);
                      },
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 20,),
                            Text(
                              "Oilaviy Shifokor (Terapevt)",
                              style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 1,
      backgroundColor: Colors.grey.shade200,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 5),
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: AppColor.textColor,
            ),
          ),
          Spacer(),
          SizedBox(width: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 49,
                height: 49,
                child: Image.asset(
                  AppImages.app,
                ),
              ),
              Text(
                "Med Home".toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(

            margin: EdgeInsets.only(top: 3,right: 10,left: 25),
            child: IconButton(
                onPressed: (() => {}),
                icon: Icon(
                  CupertinoIcons.bell_fill,
                  size: 23,
                  color: AppColor.red4,
                )),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}
