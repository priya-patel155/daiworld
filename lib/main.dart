import 'package:diaworld/core/constants/app_Color.dart';
import 'package:diaworld/views/Authorization/sign_in.dart';
import 'package:diaworld/views/deshboard/order_history.dart';
import 'package:diaworld/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Diaworld',
        theme: CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      );
    });
  }
}
