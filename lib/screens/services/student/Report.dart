import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SreportScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SreportScreen({super.key, required this.onChangedStep});

  @override
  State<SreportScreen> createState() => _SreportScreenState();
}

class _SreportScreenState extends State<SreportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            'report \n rapport '.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.post_add,
                size: 30.0,
              ),
              color: Colors.black,
              onPressed: () => widget.onChangedStep(7),
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
