// ignore_for_file: file_names, unused_field

import 'package:flutter/material.dart';

class EpasswordScreen extends StatefulWidget {
  final Function(int?, String?) onChangedStep;
  const EpasswordScreen({super.key, required this.onChangedStep});

  @override
  State<EpasswordScreen> createState() => _EpasswordScreenState();
}

class _EpasswordScreenState extends State<EpasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isSecret = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(1,null),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                Text(
                  'password'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30.0,
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
                          'Enter your password \n Entre ton mot de passe'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value!.length < 6
                            ? 'Enter a password.6 caracter min required.'
                            : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() => _isSecret = !_isSecret),
                            child: Icon(
                              !_isSecret
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: 'Ex: I love you all ',
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
                      ElevatedButton(
                        // ignore: avoid_print
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            widget.onChangedStep(null, _password);
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
