import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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