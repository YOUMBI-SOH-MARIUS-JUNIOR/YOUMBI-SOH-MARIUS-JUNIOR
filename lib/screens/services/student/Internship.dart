import 'package:flutter/material.dart';

class SintershipScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SintershipScreen({super.key, required this.onChangedStep});

  @override
  State<SintershipScreen> createState() => _SintershipScreenState();
}

class _SintershipScreenState extends State<SintershipScreen> {
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
                Icons.notifications,
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
