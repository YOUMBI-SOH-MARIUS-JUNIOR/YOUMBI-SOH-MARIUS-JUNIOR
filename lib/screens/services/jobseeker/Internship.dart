import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JintershipScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const JintershipScreen({super.key, required this.onChangedStep});

  @override
  State<JintershipScreen> createState() => _JintershipScreenState();
}

class _JintershipScreenState extends State<JintershipScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            'internship \n\n stage'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.feedback,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () => widget.onChangedStep(2),
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
