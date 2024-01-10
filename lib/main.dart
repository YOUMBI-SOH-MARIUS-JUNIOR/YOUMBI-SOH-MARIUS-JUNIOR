import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matrix/screens/Guest.dart';
import 'package:matrix/screens/guest/Auth.dart';
import 'package:matrix/screens/guest/Password.dart';
import 'package:matrix/screens/guest/Root_page.dart';
import 'package:matrix/screens/guest/Term.dart';
import 'package:matrix/screens/services/UserService.dart';

// ignore: prefer_const_constructors

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( App());
}

class App extends StatelessWidget {
   final UserService _userService = UserService();
   App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      title: 'Matrix',
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) { 
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return  RPageScreen();
            } else {
              return const GuestScreen();
            }
          }
          return const SafeArea(
            child: Scaffold(
              body: Center(
                child: Text(
                  'loading...',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
