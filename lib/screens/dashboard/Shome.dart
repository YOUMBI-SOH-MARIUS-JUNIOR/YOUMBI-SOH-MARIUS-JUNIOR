// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marius_design/screens/services/student/Employment.dart';
import 'package:marius_design/screens/services/student/Exam.dart';
import 'package:marius_design/screens/services/student/Internship.dart';
import 'package:marius_design/screens/services/student/Navigation.dart';
import 'package:marius_design/screens/services/student/NotifE.dart';
import 'package:marius_design/screens/services/student/NotifI.dart';
import 'package:marius_design/screens/services/student/Publish.dart';
import 'package:marius_design/screens/services/student/Report.dart';

class ShomeScreen extends StatefulWidget {
  const ShomeScreen({Key? key}) : super(key: key);

  @override
  State<ShomeScreen> createState() => _ShomeScreenState();
}

// ignore: camel_case_types
class _ShomeScreenState extends State<ShomeScreen> {
  final List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _widgets.addAll(
      [
        SnavigationScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SintershipScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SnotifIScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SemploymentScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SnotifEScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SexamScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        SreportScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
         SpublishScreen(
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
