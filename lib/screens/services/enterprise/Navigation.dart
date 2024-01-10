// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marius_design/screens/Guest.dart';
import 'package:marius_design/screens/services/UserService.dart';

class NavigationScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const NavigationScreen({super.key, required this.onChangedStep});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Marius Design',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_box,
              size: 30,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      drawer: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.blue),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'menu'.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => widget.onChangedStep(1),
                  child: Text(
                    'Internship'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => widget.onChangedStep(4),
                  child: Text(
                    'Employment'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _userService.logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuestScreen(),
                      ),
                      (route) => false,
                    );
                    print('exit');
                  },
                  child: Text(
                    'logout / deconnexion'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 80.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('exit');
                  },
                  child: Text(
                    'logout / deconnexion'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 80.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome to  you \n'.toUpperCase(),
                  style: const TextStyle(color: Colors.black, fontSize: 45.0),
                  children: [
                    TextSpan(
                      text: 'here your findings \n'.toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'becomes very easy.'.toUpperCase(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Enjoy your stay.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
