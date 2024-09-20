import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {this.multiline = false,
      this.height,
      required this.width,
      this.isNumber = false,
      required this.borderRadius,
      this.icon,
      this.onChanged,
      this.isPassword = false,
      required this.validator,
      Key? key,
      required this.textEditingController,
      required this.hintText,
      this.labelColor,
      this.textColor})
      : super(key: key);
  final bool multiline;
  final double width;
  final double? height;
  final bool isPassword;
  final double borderRadius;
  final IconData? icon;
  final bool isNumber;
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?) validator; // Updated validator parameter
  final textEditingController;
  final Color? labelColor;
  final Color? textColor;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
        obscureText: widget.isPassword,
        validator: widget.validator,
        maxLines: widget.multiline ? null : 1,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w700,
            color: widget.textColor ?? primaryColor,
            fontSize: 18), // Decreased the font size
        keyboardType:
            widget.isNumber ? TextInputType.phone : TextInputType.text,
        cursorColor: widget.textColor ?? primaryColor,
        focusNode: _textFieldFocusNode,
        controller: widget.textEditingController,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          focusColor: primaryColor,
          suffixIcon: Icon(widget.icon),
          labelText: widget.hintText, // Changed label to labelText
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: "Plus Jakarta Sans",
              fontWeight: FontWeight.w400,
              color: widget.labelColor ?? black.withOpacity(0.5),
              fontSize:
                  13), // Decreased the font size and adjusted the position
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
