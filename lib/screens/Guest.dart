import 'package:flutter/material.dart';
import 'package:marius_design/models/UserModel.dart';
import 'package:marius_design/screens/Auth.dart';
import 'package:marius_design/screens/Jpassword.dart';
import 'package:marius_design/screens/Jterms.dart';
import 'package:marius_design/screens/Epassword.dart';
import 'package:marius_design/screens/Eterms.dart';
import 'package:marius_design/screens/Sterms.dart';
import 'package:marius_design/screens/dashboard/Ehome.dart';
import 'package:marius_design/screens/dashboard/Jhome.dart';
import 'package:marius_design/screens/dashboard/Shome.dart';
import 'package:marius_design/screens/services/Spassword.dart';
import 'package:marius_design/screens/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  final UserService _userService = UserService();
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  late String _email;

  @override
  void initState() {
    // TODO: implement initState

    _widgets.addAll(
      [
        AuthScreen(
          onChangedStep: (index, value) => setState(() {
            _indexSelected = index;
            _email = value;
          }),
        ),
        EtermScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        JtermScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        StermScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        EpasswordScreen(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EhomeScreen()));
                }
              });
            }
          }),
        ),
        JpasswordScreen(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JhomeScreen()));
                }
              });
            }
          }),
        ),
        SpasswordScreen(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShomeScreen()));
                }
              });
            }
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
