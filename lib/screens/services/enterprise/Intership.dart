import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntershipScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const IntershipScreen({super.key, required this.onChangedStep});

  @override
  State<IntershipScreen> createState() => _IntershipScreenState();
}

class _IntershipScreenState extends State<IntershipScreen> {
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
              onPressed: () => widget.onChangedStep(3),
            ),
            IconButton(
              icon: const Icon(
                Icons.post_add,
                size: 30.0,
              ),
              color: Colors.black,
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
