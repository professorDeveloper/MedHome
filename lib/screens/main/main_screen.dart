import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/screens/home/home_screen.dart';
import 'package:medhome/screens/med_card/medcards_screen.dart';
import 'package:medhome/screens/order/orders_screen.dart';
import 'package:medhome/screens/profile/profile_screen.dart';
import 'package:medhome/utils/app_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Define the routes for each screen
  final List<Widget> _screens = [
    HomeScreen(),
    OrdersScreen(),
    MedCardsScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      body: _screens[_currentIndex],
      bottomNavigationBar: Expanded(
        child: SizedBox(
          height: 65,
          child: BottomNavigationBarTheme(
            data: BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedIconTheme: IconThemeData(
                color: AppColor.red4,
              ),
              unselectedIconTheme:
                  IconThemeData(color: AppColor.unselctedColor),
              showUnselectedLabels: true, // Hide unselected labels
              unselectedLabelStyle: GoogleFonts.rubik(
                color: AppColor.stextc,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              selectedLabelStyle: GoogleFonts.rubik(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            child: BottomNavigationBar(
              fixedColor: Colors.black,
              iconSize: 24.0, // Adjust the size as needed
              currentIndex: _currentIndex,
              onTap: (int index) {
                // Update the index when a bottom navigation item is tapped
                setState(() {
                  _currentIndex = index;
                });

                // Use Navigator to navigate to the selected screen
              },
              type: BottomNavigationBarType.fixed, // Distribute space equally
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.home),
                  ),
                  label: "Asosiy",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.library_books),
                  ),
                  label: "Buyurtmalar",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.contact_mail),
                  ),
                  label: "Med Karta",
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.person)),
                  icon: Container(
                    margin: EdgeInsets.all(0),

                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.person),
                  ),
                  label: "Akkaunt",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
