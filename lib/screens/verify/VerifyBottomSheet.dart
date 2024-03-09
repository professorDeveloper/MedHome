import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhome/blocs/verify/verify_bloc.dart';
import 'package:medhome/screens/verify/verify_sheet.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

Future<dynamic> verifyBottomSheet(BuildContext context, String phone) {
  return showModalBottomSheet(
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    enableDrag: false,

    builder: (context) {
      return BlocProvider(
        create: (context) => VerifyBloc(),
        child: VerifyBottomSheetScreen(phone: phone),
      );
    },
  );
}
