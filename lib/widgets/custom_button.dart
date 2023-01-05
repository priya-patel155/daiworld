import 'package:diaworld/core/constants/app_Color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String title;
  Function()? onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? textColor;

  CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.textStyle,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomTheme.primarycolor),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: widget.backgroundColor ?? Colors.transparent,

            //maximumSize: Size(double.infinity, 38),
            minimumSize: Size(double.infinity, 40),
            textStyle: widget.textStyle ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor ?? CustomTheme.whiteColor,
              // fontFamily: CustomTextstyleTheme.fontFamily,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
