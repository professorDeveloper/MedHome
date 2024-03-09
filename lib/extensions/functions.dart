import 'package:flutter/cupertino.dart';

extension PasswordValidation on TextEditingController {
  bool isValidPassword() {
    // Check if the password contains at least 6 characters, including at least one digit and one letter
    String password = this.text;
    return password.length >= 6 && password.contains(RegExp(r'[0-6]')) && password.contains(RegExp(r'[a-zA-Z]'));
  }
}
extension NameValidation on TextEditingController {
  bool isValidName() {
    // Check if the name contains at least one alphabet character
    String name = this.text;
    return name.isNotEmpty && name.contains(RegExp(r'[a-zA-Z]'));
  }
  bool isValidFullName() {
    // Check if the full name consists of two words (first name and last name)
    String fullName = this.text;
    List<String> nameParts = fullName.split(' ');

    return nameParts.length == 2 && nameParts.every((part) => part.isNotEmpty && part.contains(RegExp(r'[a-zA-Z]')));
  }

}
