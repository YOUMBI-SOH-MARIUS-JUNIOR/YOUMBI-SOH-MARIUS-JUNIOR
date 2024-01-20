// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project1/screens/constant.dart';

class FirstScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const FirstScreen({super.key, required this.onChangedStep});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SafeArea(child: Column(
      children: [
        const Spacer(flex: 2 ),
        Image.asset("images/test.png"),
        const Spacer(flex: 3 ),
    Text("Welcome to our freedom \n searching app",
    textAlign: TextAlign.center,
    style: Theme.of(context)
    .textTheme
    .headlineSmall
    ?.copyWith(fontWeight: FontWeight.bold),
    ),
    const Spacer(),
     Text(
      "Freedom search any opportunity \n for you. ",
     textAlign: TextAlign.center,
    style: TextStyle(
      color: Theme.of(context)
      .textTheme
      .bodyLarge
      ?.color
      ?.withOpacity(0.64),
      ),
      ),
      const Spacer(flex: 5),
      
      FittedBox(
        child: TextButton(
          onPressed: (){widget.onChangedStep(1);},
        child: Row(
          children: [Text("Skip",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.color
            ?.withOpacity(0.8)),
          ),
          const SizedBox(width: kDefaultPadding / 4),
          const Icon(
           // color : Colors.green,
            Icons.arrow_forward_ios,
          size: 16,)
          ],
          ),
          ),
      )
          
          ],
          ),
              ))
              ;
  }
}