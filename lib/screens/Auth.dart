// ignore_for_file: file_names, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;

  const AuthScreen({super.key, required this.onChangedStep});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController controllerEmail = TextEditingController();
  List<DropdownMenuItem<String>> choice = [];
  String? def;
  void choicename() {
    choice.clear();
    choice.add(
      const DropdownMenuItem(
        value: 'An Enterprise/Une Entreprise',
        child: Text(
          'An Enterprise/Une Entreprise',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
    choice.add(
      const DropdownMenuItem(
        value: 'A Student/Etudiant',
        child: Text(
          'A Student/Etudiant',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
    choice.add(
      const DropdownMenuItem(
        value: 'Jobseeker/Sans Emploie',
        child: Text(
          'Jobseeker/Sans Emploie ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var emailcontroller = TextEditingController();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Everyone has \n'.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 35.0),
                    children: [
                      TextSpan(
                        text: 'knowledge\n'.toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'to share.'.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'It all starts here.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 50.0),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Enter your email \n Entre ton email'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: controllerEmail,
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value!.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Please enter a VALID email'
                                : null,
                        decoration: InputDecoration(
                          hintText: 'Ex: ju4@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SafeArea(
                            child: DropdownButton(
                              value: def,
                              dropdownColor:
                                  const Color.fromARGB(255, 7, 26, 59),
                              elevation: 100,
                              items: choice,
                              hint: const Text(
                                'LOGIN as ... \n Connecte Toi entant que ...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onChanged: (value) {
                                def = value as String?;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                      ElevatedButton(
                        onPressed: !emailRegex.hasMatch(_email)
                            ? null
                            :
                            () {
                          if (_formkey.currentState!.validate()) {
                            if (def ==
                                          'An Enterprise/Une Entreprise') {
                                        widget.onChangedStep(1, _email);
                                        final user = User(
                                           
                                            Email: controllerEmail.text,
                                            def: 'Enterprise');
                                        createUser(user);
                                      } else {
                                        if (def == 'A Student/Etudiant') {
                                          widget.onChangedStep(3, _email);
                                          final user = User(
                                             
                                              Email: controllerEmail.text,
                                              def: 'Student');
                                          createUser(user);
                                        } else {
                                          if (def == 'Jobseeker/Sans Emploie') {
                                            widget.onChangedStep(2, _email);
                                            final user = User(
    
                                                Email: controllerEmail.text,
                                                def: 'Jobseeker');
                                            createUser(user);
                                          }
                                        }
                                      }
                          }
                        },
                        child: Text(
                          'continue'.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('User').doc();

  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String Email;
  String def;

  User({  
    required this.Email,
    required this.def,
  });
  Map<String, dynamic> toJson() => {
        'Email': Email,
        'Type': def,
      };
}
