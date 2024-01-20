import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
child: ElevatedButton(
  onPressed: () {},
  child: const Text('here is the \n News Page'),
),
    );
  }
}