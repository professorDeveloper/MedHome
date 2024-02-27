import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhome/utils/app_color.dart';
import 'package:new_version/new_version.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_text.dart';
import 'my_pref.dart';

class AppFunctions {
  AppFunctions._();

  static void checkVersion(BuildContext context) {
    final version = NewVersion(
      androidId: "com.nurofficial.medhome",
    );
    version.showAlertIfNecessary(context: context);
  }

  static initPlatformState() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
      if (deviceId != null) {
        Prefs.setString(AppText.deviceId, deviceId);
      }
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    print("deviceId->$deviceId");
  }

  static Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Future<bool> isConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }



}
