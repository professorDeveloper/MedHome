import 'package:flutter/material.dart';

class MyOTPView extends StatefulWidget {
  @override
  _MyOTPViewState createState() => _MyOTPViewState();
}

class _MyOTPViewState extends State<MyOTPView> {
  List<String> otp = List.filled(6, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildOtpRow(),
            SizedBox(height: 20),
            buildCustomKeyboard(),
          ],
        ),
      ),
    );
  }

  Widget buildOtpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => buildOtpBox(otp[index]),
      ),
    );
  }

  Widget buildOtpBox(String value) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildCustomKeyboard() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          buildKeyboardRow(["1", "2", "3"]),
          buildKeyboardRow(["4", "5", "6"]),
          buildKeyboardRow(["7", "8", "9"]),
          buildKeyboardRow(["", "0", "<"]),
        ],
      ),
    );
  }

  Widget buildKeyboardRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys
          .map(
            (key) => key.isEmpty ? buildEmptyKey() : buildNumberKey(key),
          )
          .toList(),
    );
  }

  Widget buildNumberKey(String number) {
    return KeyButton(
      onPressed: () {
        onKeyTap(number);
        checkOtpComplete(); // Check for OTP completion after each key tap
      },
      text: number,
      color: Colors.red, // Red color for the key background
    );
  }

  Widget buildEmptyKey() {
    return Container(
      width: 75,
      height: 50,
    );
  }

  void onKeyTap(String key) {
    setState(() {
      if (key == "<") {
        otp.removeLast();
      } else if (otp.length < 6) {
        otp.add(key);
      }
    });
  }

  void checkOtpComplete() {
    if (otp.length == 6) {
      // OTP is complete, perform necessary actions
      onOtpComplete();
    }
  }

  void onOtpComplete() {
    // Print the OTP when it is complete
    print('OTP Complete: ${otp.join()}');
  }
}

class KeyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  KeyButton({required this.onPressed, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
    );
  }
}
