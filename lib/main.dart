import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart';
import 'package:marius_design/screens/Guest.dart';
import 'package:marius_design/screens/dashboard/Ehome.dart';
import 'package:marius_design/screens/services/UserService.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  final UserService _userService = UserService();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'marius_design',
        home:  StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const EhomeScreen();
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
      ),);
  }
}
