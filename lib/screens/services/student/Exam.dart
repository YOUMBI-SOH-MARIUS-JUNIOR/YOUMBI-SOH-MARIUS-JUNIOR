import 'package:flutter/material.dart';

class SexamScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SexamScreen({super.key, required this.onChangedStep});

  @override
  State<SexamScreen> createState() => _SexamScreenState();
}

class _SexamScreenState extends State<SexamScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            'competitive exam \n concours '.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
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
