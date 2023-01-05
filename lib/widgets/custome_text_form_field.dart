import 'package:diaworld/core/constants/app_Color.dart';
import 'package:flutter/material.dart';

class CoustomInPutField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? fieldName;
  final TextCapitalization? textCapitalization;
  final String? hint;
  final TextInputType? fieldInputType;
  final bool? enabled;
  final Color? bgColor;
  final int? maxLines;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChange;
  final ValueChanged<String?>? onSave;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final double? contentpadding;
  final Color? cursorcolor;
  final TextStyle? hintStyle;
  final double? cursorHeight;
  final String? prefixText;
  final TextStyle? prefixStyle;

  const CoustomInPutField(
      {Key? key,
      this.fieldName,
      this.prefixStyle,
      this.textCapitalization,
      this.bgColor,
      this.fieldInputType,
      this.fieldController,
      this.enabled,
      this.maxLines,
      this.maxLength,
      this.validator,
      this.onTap,
      this.onSave,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.contentpadding,
      this.onChange,
      this.cursorcolor,
      this.hintStyle,
      this.prefixText,
      this.cursorHeight})
      : super(key: key);

  @override
  _CoustomInPutFieldState createState() => _CoustomInPutFieldState();
}

class _CoustomInPutFieldState extends State<CoustomInPutField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;

    return Container(
        alignment: Alignment.center,
        height: hight / 15,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.centerLeft,
          ),
          TextFormField(
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              style: TextStyle(fontSize: 16, color: CustomTheme.blackColor),
              cursorColor: widget.cursorcolor,
              cursorHeight: widget.cursorHeight,
              controller: widget.fieldController,
              keyboardType: widget.fieldInputType ?? TextInputType.text,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              enabled: widget.enabled ?? true,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              validator: widget.validator ?? null,
              obscureText: widget.obscureText ?? false,
              onTap: widget.onTap ?? null,
              onChanged: widget.onChange ?? null,
              onSaved: widget.onSave ?? null,
              decoration: InputDecoration(
                hintStyle: widget.hintStyle,
                border: InputBorder.none,
                prefixStyle: widget.prefixStyle,
                hintText: widget.hint ?? "",
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                prefixText: widget.prefixText ?? "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                isDense: true,
              )),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomTheme.whiteColor,
        ));
  }
}
