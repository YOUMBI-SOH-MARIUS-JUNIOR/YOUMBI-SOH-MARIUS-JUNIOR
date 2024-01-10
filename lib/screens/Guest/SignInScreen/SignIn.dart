// ignore_for_file: unused_field, non_constant_identifier_names, duplicate_ignore, file_names

import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  final Function(int) onChangedStep;
    const SignInScreen({
    super.key,required this.onChangedStep,
    
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  
  
  

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var emailcontroller = TextEditingController();
  String _email = "";
  // ignore: non_constant_identifier_names
  final String _Name = "";
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              widget.onChangedStep(0);
            },
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // ignore: prefer_const_constructors
              /*decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/m.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                ),
              ),*/
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'welcome \n'.toUpperCase(),
                        style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold,fontSize: 38.0),
    
                        children: [
                          TextSpan(
                            text: 'come back\n'.toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'between us.'.toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'It all starts here.',
                      style: TextStyle(
                        
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                         
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            'Enter your last Logup Email',
                            
                          ),
                           Text(
                            'Entre ton Email de la premier inscription',
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
                            controller: controllerEmail,
                            //style: const TextStyle(color: Colors.white),
                            onChanged: (value) =>
                                setState(() => _email = value),
                            validator: (value) =>
                                value!.isEmpty || !emailRegex.hasMatch(value)
                                    ? 'Please enter a VALID Email'
                                    : null,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.email,
                                color:Colors.teal,
                              ),
                              hintText: 'Ex:Ju4@gmail.com ',
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
                          
                          const SizedBox(
                            height: 15.0,
                          ),
                          // ignore: deprecated_member_use
                          ElevatedButton( 
                            onPressed: !emailRegex.hasMatch(_email)
                                ? null
                                : () {
                                  if (_formkey.currentState!.validate()){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                         return const AlertDialog(
                                          title: Text('Fetching Your Email...',style: TextStyle(
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
                                       Future.delayed(const Duration(seconds: 3),
                                       (){
                                        Navigator.of(context).pop();
                                        widget.onChangedStep(4);
                                        
                                       });
                                  }
                                 },    
                            child: Text(
                              'next'.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withOpacity(0.8)),
                                )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

/*Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('User').doc();

  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String Name;
  String Email;
  String def;

  User({
    required this.Name,
    required this.Email,
    required this.def,
  });
  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Email': Email,
        'Type': def,
      };
}*/
