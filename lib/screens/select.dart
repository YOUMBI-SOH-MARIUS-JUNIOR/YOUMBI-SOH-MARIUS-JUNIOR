import 'package:flutter/material.dart';
import 'package:project1/screens/ElevatedButton.dart';
import 'package:project1/screens/constant.dart';

class ChoiceScreen extends StatefulWidget {
  
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
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
              const Text('Which offer do you want to publish?'),
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
                                        
                                        
                                       });
                                       }, text: 'INTERNSHIP/STAGE',
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
                                        
                                        
                                       });
                                       }, text: 'RECRUTEMENT',
                
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
                                        
                                        
                                       });
                                       }, text: 'CONCOURS',
                
              ),
              const Spacer(flex: 2),
            ],
            ),
        ),
          ),
    );
  }
}
