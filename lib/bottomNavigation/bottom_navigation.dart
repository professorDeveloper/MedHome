import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medhome/screens/home/home_screen.dart';

import '../screens/BuyurtmalarScreen/BuyurtmalarScreen_screen.dart';
import '../screens/Mahsulotlar/Mahsulotlar_screen.dart';
import '../screens/medkarta/medkarta_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const BuyurtmalarScreen(),
    const MedkartaScreen(),
    const MahsulotlarScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bottom_home.svg',
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/bottom_home.svg',
              color: const Color.fromARGB(255, 231, 52, 73),
              width: 20,
              height: 20,
            ),
            label: 'Asosiy',
            tooltip: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bottom_2.svg',
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/bottom_2.svg',
              color: const Color.fromARGB(255, 231, 52, 73),
              width: 20,
              height: 20,
            ),
            label: 'Buyurtmalar',
            tooltip: 'Buyurtmalar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bottom_3.svg',
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/bottom_3.svg',
              color: const Color.fromARGB(255, 231, 52, 73),
              width: 20,
              height: 20,
            ),
            label: 'Med Karta',
            tooltip: 'Med Karta',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bottom_4.svg',
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/bottom_4.svg',
              color: const Color.fromARGB(255, 231, 52, 73),
              width: 20,
              height: 20,
            ),
            label: 'Mahsulotlar',
            tooltip: 'Mahsulotlar',
          ),
        ],
        currentIndex: _currentIndex,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      body: _screens[_currentIndex],
    );
  }
}
