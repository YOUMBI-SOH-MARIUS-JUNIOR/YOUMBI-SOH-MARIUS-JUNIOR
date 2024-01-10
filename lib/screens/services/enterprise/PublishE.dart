import 'package:flutter/material.dart';

class EpublishScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const EpublishScreen({super.key, required this.onChangedStep});

  @override
  State<EpublishScreen> createState() => _EpublishScreenState();
}

class _EpublishScreenState extends State<EpublishScreen> {
  TextEditingController controllerPosti = TextEditingController();
  TextEditingController controllerSpecialityi = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _Post = '';
  String _School = '';
  @override
  Widget build(BuildContext context) {
    const maxlines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'Marius Design',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => widget.onChangedStep(4),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'post'.toUpperCase(),
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const Text(
                            'publication',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextFormField(
                            controller: controllerPosti,
                            style: const TextStyle(color: Colors.black),
                            maxLines: maxlines,
                            onChanged: (value) => setState(() => _Post = value),
                            validator: (value) => value!.isEmpty
                                ? 'Please enter Your POST'
                                : null,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.post_add_outlined,
                                color: Colors.blue,
                              ),
                              hintText:
                                  '\n\nEnter your post here in English and French. \n Entre ton post ici en Francais et en Anglais.',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Which level ? & Which Speciality ?',
                            style: TextStyle(color: Colors.blue),
                          ),
                          const Text(
                            'Quel niveu ? & Quel Specialités ? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextFormField(
                            controller: controllerSpecialityi,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (value) =>
                                setState(() => _School = value),
                            validator: (value) => value!.isEmpty
                                ? 'Please enter the level & Speciality'
                                : null,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.school,
                                color: Colors.blue,
                              ),
                              hintText:
                                  'Level 2 & Information System & Management',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {}
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
          ],
        ),
      ),
    );
  }
}
