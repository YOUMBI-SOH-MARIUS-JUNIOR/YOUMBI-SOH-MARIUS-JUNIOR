// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marius_design/screens/services/jobseeker/Exam.dart';
import 'package:marius_design/screens/services/jobseeker/Internship.dart';
import 'package:marius_design/screens/services/jobseeker/Navigation.dart';
import 'package:marius_design/screens/services/jobseeker/Notif.dart';
import 'package:marius_design/screens/services/jobseeker/employment.dart';
import 'package:marius_design/screens/services/jobseeker/notifJ.dart';



class JhomeScreen extends StatefulWidget {
  const JhomeScreen({Key? key}) : super(key: key);

  @override
  State<JhomeScreen> createState() => _JhomeScreenState();
}

// ignore: camel_case_types
class _JhomeScreenState extends State<JhomeScreen> {
  final List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _widgets.addAll(
      [
        JnavigationScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        JintershipScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        JnotifScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ), 
         JmploymentScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        JnotifEScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        JexamScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
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
