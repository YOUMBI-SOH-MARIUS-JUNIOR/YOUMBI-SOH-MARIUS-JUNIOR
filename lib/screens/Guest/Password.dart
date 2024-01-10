// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project1/screens/Guest/navigation/navigation.dart';


class PasswordScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  
  const PasswordScreen({super.key, required this.onChangedStep});

  @override 
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isSecret = true;
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Stack(
          children: [
            Center(
              
              child: SingleChildScrollView(
              
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  children: [
                    Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light?"images/logo1.png"
                :"images/logo1.png",
              height: 200,
              ),
                    Text("PASSWORD",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold,fontSize: 40),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Enter your Password',
                             
                            ),
                             Text(
                            'Entre ton mot de passe',
                            style: TextStyle(
                              color: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color
                              ?.withOpacity(0.64),
                              ),
                              ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => _password = value),
                              validator: (value) => value!.length < 6
                                  ? 'Enter your password. 6 caracters min required'
                                  : null,
                              obscureText: _isSecret,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      setState(() => _isSecret = !_isSecret),
                                  child: Icon(
                                    !_isSecret
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintText: 'Ex:123456 ',
                              hintStyle:  TextStyle(
                                color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withOpacity(0.64),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            // ignore: deprecated_member_use
                            ElevatedButton(
                              onPressed: _password.length < 6
                                  ? null
                                  : () {
                                      if (_formkey.currentState!.validate()) {
                                       showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                         return const AlertDialog(
                                          title: Text('Loging In...',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                          ),
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
                                        Future.delayed(const Duration(seconds: 4),
                                        () {
                                           Navigator.of(context).pop();
                                        
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Login Successful',
                                              style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize:20.0,
                                                color:Colors.black,
                                              ),
                                              ),
                                           
                                          content: const Text('You Have Successfully logged in !',style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey
                                          ),
                                          ),
                                          actions: [TextButton(style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)), onPressed: () {
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavigationScreen()));
                                            },
                                          child:  const Text('OK', style: TextStyle(fontSize: 16.0),),)],
                                        );
                                         }
                                        );
                                      }
                                    
                              
                            );
                            
                             }
                              }, 
                              child: Text(
                                'connect'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                        )
                        ]
                        ),
                  
                
              ),
            
          ],
        ),
      ),
    )
     ]
      )
       ),
       );
       }
        }