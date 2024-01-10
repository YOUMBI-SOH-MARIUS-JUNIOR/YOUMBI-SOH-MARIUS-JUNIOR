import 'package:flutter/material.dart';

class SemploymentScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SemploymentScreen({super.key, required this.onChangedStep});

  @override
  State<SemploymentScreen> createState() => _SemploymentScreenState();
}

class _SemploymentScreenState extends State<SemploymentScreen> {
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
                Icons.notifications,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () => widget.onChangedStep(4),
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
