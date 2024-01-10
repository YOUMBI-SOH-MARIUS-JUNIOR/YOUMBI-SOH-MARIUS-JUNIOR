import 'package:flutter/material.dart';
import 'package:marius_design/screens/services/enterprise/Employment.dart';
import 'package:marius_design/screens/services/enterprise/Intership.dart';
import 'package:marius_design/screens/services/enterprise/Navigation.dart';
import 'package:marius_design/screens/services/enterprise/NotifE.dart';
import 'package:marius_design/screens/services/enterprise/NotifI.dart';
import 'package:marius_design/screens/services/enterprise/PublishE.dart';
import 'package:marius_design/screens/services/enterprise/PublishI.dart';
import 'package:marius_design/screens/services/enterprise/PublishR.dart';
import 'package:marius_design/screens/services/enterprise/ReportE.dart';

class EhomeScreen extends StatefulWidget {
  const EhomeScreen({Key? key}) : super(key: key);

  @override
  State<EhomeScreen> createState() => _EhomeScreenState();
}

// ignore: camel_case_types
class _EhomeScreenState extends State<EhomeScreen> {
  final List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _widgets.addAll(
      [
         NavigationScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        IntershipScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        IpublishScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        InotifScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        EmploymentScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        EpublishScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        EnotifScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        ReportScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index),
        ),
        RpublishScreen(
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
