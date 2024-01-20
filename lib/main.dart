import 'package:flutter/material.dart';
import 'package:project1/screens/AI.dart';
import 'package:project1/screens/Guest.dart';
import 'package:project1/screens/Guest/SignupScreen/SignUp.dart';
import 'package:project1/screens/Guest/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:project1/screens/theme.dart';



void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (context)=> UserProvider(),
                                child: const NavigationScreen(), )
      ],
      child: const App(),
    ),
  );


class App extends StatelessWidget {
  const App({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const GuestScreen()
    );
  }
}
