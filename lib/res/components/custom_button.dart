import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 44,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the button color to blue
            shape: StadiumBorder(),
          ),
          onPressed: onTap,
          child: Text(buttonText, style: TextStyle(color: Colors.white))),
    );
  }
}
