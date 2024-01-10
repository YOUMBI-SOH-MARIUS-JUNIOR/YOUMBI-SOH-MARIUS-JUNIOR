// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project1/screens/constant.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton ({
    super.key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.padding = const EdgeInsets.all(kDefaultPadding * 0.75),
  });
  final String text;
  final VoidCallback press;
  final color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40),),),
        padding: padding,
        color: color,
        minWidth: double.infinity,
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
    );
  }
}