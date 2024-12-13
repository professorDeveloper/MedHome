import 'package:flutter/material.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
        child: SafeArea(child: Scaffold(
          body: Center(
            child: Text("data",style: TextStyle(
              fontSize: 20
            ),),
          ),
        )));
  }
}
