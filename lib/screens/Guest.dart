// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project1/screens/Guest/Password.dart';
import 'package:project1/screens/Guest/SignInScreen/SignIn.dart';
import 'package:project1/screens/Guest/SignupScreen/SignUp.dart';
import 'package:project1/screens/Guest/SignupScreen/terms.dart';
import 'package:project1/screens/Guest/first.dart';
import 'package:project1/signin_or_signup_screen.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  final List<Widget>_widgets = [];
  int _indexSelected = 0;

@override 
  void initState() {
  super.initState();

  _widgets.addAll([
 FirstScreen(
onChangedStep: (index) => setState(() => _indexSelected= index ),
),
SigninOrSignupScreen(
onChangedStep: (index) => setState(() => _indexSelected= index ),
),
SignUpScreen(
  onChangedStep: (index) => setState(() => _indexSelected= index ),
  ),
TermScreen(
  onChangedStep: (index) => setState(() => _indexSelected= index ),
),
  PasswordScreen(
  onChangedStep: (index) => setState(() => _indexSelected= index ),
),
SignInScreen(
  onChangedStep: (index) => setState(() => _indexSelected= index ),
  ),


  ]);
}

     @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}