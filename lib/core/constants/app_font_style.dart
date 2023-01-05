// FONT FAMILY
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

const String gorditaFamily = "Gordita";
const String gilroyFamily = "Gilroy";

//FONT WEIGHT

class FontWeightClass {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

/// FONT TEXT STYLE

class FontTextStyle {
  // Title
  static TextStyle gilroyW7S207darkGrey = TextStyle(
      fontFamily: gilroyFamily,
      fontSize: 40.sp,
      // color: ColorUtils.darkGrey,
      fontWeight: FontWeightClass.bold);

  static TextStyle gilroyW7S147darkGrey =
      gilroyW7S207darkGrey.copyWith(fontSize: 14.sp);

  static TextStyle gilroyW7S147darkBlack =
      gilroyW7S147darkGrey.copyWith(fontFamily: gilroyFamily, fontSize: 16.sp);
//10
  static TextStyle GorditaW7S10darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      //color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);

  static TextStyle GorditaW5S10lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      // color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);

  static TextStyle GorditaW5S10white = GorditaW5S10lightBlack.copyWith(
      // color: ColorUtils.white,
      );

  static TextStyle GorditaW5S8white =
      GorditaW5S10white.copyWith(fontSize: 8.sp);

  static TextStyle GorditaW7S10lightBlack =
      GorditaW5S10lightBlack.copyWith(fontWeight: FontWeightClass.bold);
  static TextStyle GorditaW7S16lightBlack =
      GorditaW7S10lightBlack.copyWith(fontSize: 16.sp);

  static TextStyle gilroyW7S24darkBlack =
      GorditaW7S10darkBlack.copyWith(fontSize: 20.sp);
  static TextStyle gilroyW7S12primaryColor = gilroyW7S24darkBlack.copyWith(
      // color: ColorUtils.primaryColor,
      fontSize: 12.sp);

  static TextStyle GorditaW7S24darkBlack =
      gilroyW7S24darkBlack.copyWith(fontFamily: gorditaFamily);

//12 dark black
  static TextStyle GorditaW7S12darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 12.sp,
      // color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);

  static TextStyle GorditaW7S10white = GorditaW7S12darkBlack.copyWith(
      // color: ColorUtils.white,
      fontSize: 10.sp);
//12
  static TextStyle GorditaW5S12lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 12.sp,
      //color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);
  //15 dark balack
  static TextStyle GorditaW7S15darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 15.sp,
      // color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);

  static TextStyle GorditaW5S8lightBlack =
      GorditaW5S12lightBlack.copyWith(fontSize: 8.sp);

  static TextStyle GorditaW7S15white = GorditaW7S15darkBlack.copyWith();
//change
  // static TextStyle GorditaW5S10lightBlack =
  //     GorditaW5S12lightBlack.copyWith(fontSize: 10.sp);
  static TextStyle GorditaW5S10accent = GorditaW5S10lightBlack.copyWith(
      // color: ColorUtils.accent,
      );
  static TextStyle GorditaW5S10primarycolor = GorditaW5S10lightBlack.copyWith();

  static TextStyle GorditaW5S10grey = GorditaW5S10primarycolor.copyWith();

  //14
  static TextStyle GorditaW5S14lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 14.sp,
      // color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);
  static TextStyle GorditaW5S14darkBlack = GorditaW5S14lightBlack.copyWith();

  static TextStyle GorditaW7S14white = GorditaW5S14lightBlack.copyWith(
      // color: ColorUtils.white,
      fontWeight: FontWeight.bold);

  static TextStyle GorditaW5S12darkBlack =
      GorditaW5S14darkBlack.copyWith(fontSize: 12.sp);

  static TextStyle GorditaW5S12accent = GorditaW5S12darkBlack.copyWith();

  static TextStyle GorditaW5S10darkBlack =
      GorditaW5S14darkBlack.copyWith(fontSize: 10.sp);

  //18
  static TextStyle GorditaW5S18lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 18.sp,
      fontWeight: FontWeightClass.medium);

  static TextStyle GorditaW7S18darkBlack = GorditaW5S18lightBlack.copyWith(
      // color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);
  static TextStyle GorditaW7S14darkBlack =
      GorditaW7S18darkBlack.copyWith(fontSize: 14.sp);
  static TextStyle GorditaW7S16darkBlack =
      GorditaW7S18darkBlack.copyWith(fontSize: 16.sp);
  //12 with underline text
  static TextStyle GorditaW5S12darkBlackunderline = TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      fontWeight: FontWeightClass.medium);
  //25
  static TextStyle GorditaW5S25lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 20.sp,
      fontWeight: FontWeightClass.medium);

  static TextStyle GorditaW5S25darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 20.sp,
      fontWeight: FontWeightClass.extraB);

  static TextStyle GorditaW4S10black = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      fontWeight: FontWeightClass.regular);

  static TextStyle GorditaW4S10lightBlack = GorditaW4S10black.copyWith(
    fontSize: 10.sp,
    //    color: ColorUtils.lightBlack
  );

  static TextStyle GorditaW4S8offBlack =
      GorditaW4S10lightBlack.copyWith(color: Color(0xB3012239), fontSize: 8.sp);

  // black
  static TextStyle GorditaW9S14lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 14.sp,
      fontWeight: FontWeightClass.black);
  static TextStyle GorditaW9S14darkBlack = GorditaW9S14lightBlack.copyWith();
}
