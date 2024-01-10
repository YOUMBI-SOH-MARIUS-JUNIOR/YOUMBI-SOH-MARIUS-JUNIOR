import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmploymentScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const EmploymentScreen({super.key, required this.onChangedStep});

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            'Employment \n recrutement emploie '.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.feedback_outlined,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () => widget.onChangedStep(6),
            ),
            IconButton(
              icon: const Icon(
                Icons.post_add,
                size: 30.0,
              ),
              color: Colors.black,
              onPressed: () => widget.onChangedStep(5),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: () => widget.onChangedStep(0),
          ),
        ),
      ),
    );
  }
}
