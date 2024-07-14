import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textcolor;
  final Color bordercolor;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.textController,
      this.textcolor = Colors.black,
      this.bordercolor = Colors.black});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: AppColors.blueColor,
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor)),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.textcolor)),
    );
  }
}
