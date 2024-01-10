import 'package:flutter/material.dart';
import 'package:matrix/screens/guest/Auth.dart';
import 'package:matrix/screens/guest/Password.dart';
import 'package:matrix/screens/guest/Root_page.dart';
import 'package:matrix/screens/guest/Term.dart';
import 'package:matrix/screens/services/UserService.dart';

import '../models/UserModel.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();

  final List<Widget> _widgets = [];
  int _indexSelected = 0;

  late String _email;
  @override
  void initState() {
    super.initState();
    _widgets.addAll([
      AuthScreen(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }),
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep: (index, value) => setState(() {
          if (index != null) {
            _indexSelected = index;
          }
          if (value != null) {
            _userService
                .auth(UserModel(
              email: _email,
              password: value,
              uid: '',
            ))
                .then((value) {
              if (value.uid != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RPageScreen()));
              }
            });
          }
        }),
      ),
    ]);

    @override
    Widget build(BuildContext context) {
      return Container(
        child: _widgets.elementAt(_indexSelected),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
