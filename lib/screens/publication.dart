import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  File? _imageFile;
 TextEditingController controllerPost = TextEditingController();
  TextEditingController controllerOffer = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Post = '';
  String _School = '';
  @override
  Widget build(BuildContext context) {
    const maxlines = 3;
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Freedom'.toUpperCase(),
          style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
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
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'post'.toUpperCase(),
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const Text(
                            'publication',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextFormField(
                            controller: controllerPost,
                            style:  const TextStyle(fontWeight: FontWeight.bold),
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
                                  '\nEnter your post here ...',
                              
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
                            'Type of offer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                          const Text(
                            'Type offre',
                            style: TextStyle(
                             
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextFormField(
                            controller: controllerOffer,
                            style:  const TextStyle(fontWeight: FontWeight.bold),
                            onChanged: (value) =>
                                setState(() => _School = value),
                            validator: (value) => value!.isEmpty
                                ? 'Please enter the offer type'
                                : null,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.school,
                                color: Colors.blue,
                              ),
                              hintText:
                                  'Internship/concours/recrutement/actuality',
                              
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 16.0,),
                          
                          if(_imageFile != null)
                          SizedBox(
                            width: 300.0,
                            height: 300.0,
                            child: Image.file(_imageFile! ,
                          fit: BoxFit.cover,),
                          ),
                          const SizedBox(height: 70.0,),
                        
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: Text(
                              'Publish'.toUpperCase(),
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
        floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: _pickImageFromGallery,
              child: const Icon(Icons.photo_library),
            ),
          ),
          
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: _pickImageFromCamera,
                child: const Icon(Icons.camera_alt),
              ),
            ),
        ],
      ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if(pickedImage != null){
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }
}