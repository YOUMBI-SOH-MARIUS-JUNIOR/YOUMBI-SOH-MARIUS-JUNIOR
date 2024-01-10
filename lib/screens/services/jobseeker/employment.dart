import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JmploymentScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const JmploymentScreen({super.key, required this.onChangedStep});

  @override
  State<JmploymentScreen> createState() => _JmploymentScreenState();
}

class _JmploymentScreenState extends State<JmploymentScreen> {
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
