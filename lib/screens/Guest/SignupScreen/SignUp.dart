// ignore_for_file: unused_field, non_constant_identifier_names, duplicate_ignore, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  final Function(int) onChangedStep;

    const SignUpScreen({
    super.key, required this.onChangedStep,
    
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  
  
  

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var emailcontroller = TextEditingController();
  String _email = "";
  // ignore: non_constant_identifier_names
  String _Name = "";
  // ignore: prefer_typing_uninitialized_variables
String _Phone = "";
  @override
  Widget build(BuildContext context) {
    final counterModel=Provider.of<UserProvider>(context);
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
                        text: 'everyone has\n'.toUpperCase(),
                        style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold,fontSize: 38.0),
    
                        children: [
                          TextSpan(
                            text: 'kwoledge\n'.toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'to share.'.toUpperCase(),
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
                          const Text(
                            'Enter your Name',
                            
                          ),
                           Text(
                            'Entre ton Noms',
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
                            
                            controller: controllerName,
                            //style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              counterModel.setName(value);
                            },
                            validator: (value) => value!.isEmpty
                                ? 'Please enter Your NAME'
                                : null,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.person,
                                color:Colors.teal,                              ),
                              hintText: 'Ex:Mariuslover ',
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
                          const Text(
                            'Enter your Phone Number',
                            
                          ),
                           Text(
                            'Entre ton Numero de Telephone',
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
                            controller: controllerPhone,
                            //style: const TextStyle(color: Colors.white),
                            onChanged: (data) => setState(() => _Phone = data),
                            validator: (data) => data!.isEmpty
                                ? 'Please enter Your Phone Number'
                                : null,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.phone,
                                color:Colors.teal,                              ),
                              hintText: 'Ex:680985xxx ',
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
                          const Text(
                            'Enter your Email',
                            
                          ),
                           Text(
                            'Entre ton Email',
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
                            counterModel.setemail(_email = value),
                                //setState(() => _email = value),
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
                            onPressed:!emailRegex.hasMatch(_email)
                                ? null
                                : () {
                                  if (_formkey.currentState!.validate()){
                                    
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                         return const AlertDialog(
                                          title: Text('Saving...',style: TextStyle(
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
                                        widget.onChangedStep(3);
                                        
                                       });
                                       
                                  }
                                  
                                 },    
                            child: Text(
                              'CONTINUE'.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withOpacity(0.9)),
                                ),
                                ),
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

class UserProvider with ChangeNotifier{
  String _Name='';
  String _email='';
  String _Phone = "";
  String get Name => _Name;
  String get email =>  _email;
  String get Phone =>  _Phone;
  void setName(String Name){
    _Name = Name;
    notifyListeners();
  }
  void setemail(String email){
    _email = email;
    notifyListeners();
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
