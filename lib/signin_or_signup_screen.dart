import 'package:flutter/material.dart';
import 'package:project1/screens/ElevatedButton.dart';
import 'package:project1/screens/constant.dart';

class SigninOrSignupScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const SigninOrSignupScreen({super.key, required this.onChangedStep});

  @override
  State<SigninOrSignupScreen> createState() => _SigninOrSignupScreenState();
}

class _SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              widget.onChangedStep(0);
            },
          ),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light?"images/logo.png"
                :"images/logo.png",
              height: 300,
              ),
              const Spacer(),
              ElevatedButtone(
                onPressed :(){
                  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                         return const AlertDialog(
                                          content:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                                strokeWidth: 3.0,
                                              ),
                                              SizedBox(width: 16.0,),
                                              Text('Please wait...',
                                              style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey,
                                              ),
                                              ),
                                            ],
                                          )
                                         );
                                        }
                                       );
                                       Future.delayed(const Duration(seconds: 3),
                                       (){
                                        Navigator.of(context).pop();
                                        widget.onChangedStep(2);
                                        
                                       });
                                       }, text: 'SignUp',
                                       ),
              const SizedBox(
                      height: 20.0,
                    ),
              ElevatedButtone(
                onPressed :(){
                  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                         return const AlertDialog(
                                          content:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                                strokeWidth: 3.0,
                                              ),
                                              SizedBox(width: 16.0,),
                                              Text('Please wait...',
                                              style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey,
                                              ),
                                              ),
                                            ],
                                          )
                                         );
                                        }
                                       );
                                       Future.delayed(const Duration(seconds: 3),
                                       (){
                                        Navigator.of(context).pop();
                                        widget.onChangedStep(5);
                                        
                                       });
                                       }, text: 'SignIn',
                
              ),
              const Spacer(flex: 2),
            ],
            ),
        ),
          ),
    );
  }
}
