import 'dart:async';

import 'package:diaworld/core/constants/app_assets.dart';
import 'package:diaworld/views/Authorization/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'deshboard/deshboard_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () => getData());
    super.initState();
  }

  SharedPreferences? Shared;
  void getData() async {
    Shared = await SharedPreferences.getInstance();
    if (Shared!.getString("register") != null) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return Deshboard();
        },
      ), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return SignIn();
        },
      ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          ImageUtils.diamondslogo,
          height: 70.w,
        ),
      ),
    );
  }
}
