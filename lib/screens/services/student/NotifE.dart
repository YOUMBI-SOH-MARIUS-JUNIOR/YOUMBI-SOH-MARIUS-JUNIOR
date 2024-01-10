import 'package:flutter/material.dart';

class SnotifEScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SnotifEScreen({super.key, required this.onChangedStep});

  @override
  State<SnotifEScreen> createState() => _SnotifEScreenState();
}

class _SnotifEScreenState extends State<SnotifEScreen> {
  @override
  Widget build(BuildContext context) {
    const maxlines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'Marius Design',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => widget.onChangedStep(3),
          ),
        ),
      ),
    );
  }
}
