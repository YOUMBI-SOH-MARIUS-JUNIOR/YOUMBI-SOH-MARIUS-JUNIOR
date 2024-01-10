import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class PubScreen extends StatefulWidget {
  const PubScreen({super.key});

  @override
  State<PubScreen> createState() => _PubScreenState();
}

class _PubScreenState extends State<PubScreen> {
   List<XFile>? _mediaFileList;
   void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }
  dynamic _pickImageError;
  bool isVideo = false;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  TextEditingController controllerPosti = TextEditingController();
  TextEditingController controllerSpecialityi = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Post = '';
String _School = '';
  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
    bool isMultiImage = false,
    bool isMedia = false,
  }) async {
    if (context.mounted) {
        if (isMultiImage) {
        await _displayPickImageDialog(context,
            (double? maxWidth, double? maxHeight, int? quality) async {
          try {
            final List<XFile> pickedFileList = isMedia
                ? await _picker.pickMultipleMedia(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    imageQuality: quality,
                  )
                : await _picker.pickMultiImage(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    imageQuality: quality,
                  );
            setState(() {
              _mediaFileList = pickedFileList;
            });
          } catch (e) {
            setState(() {
              _pickImageError = e;
            });
          }
        });
      } else if (isMedia) {
        await _displayPickImageDialog(context,
            (double? maxWidth, double? maxHeight, int? quality) async {
          try {
            final List<XFile> pickedFileList = <XFile>[];
            final XFile? media = await _picker.pickMedia(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality,
            );
            if (media != null) {
              pickedFileList.add(media);
              setState(() {
                _mediaFileList = pickedFileList;
              });
            }
          } catch (e) {
            setState(() {
              _pickImageError = e;
            });
          }
        });
      } else {
        await _displayPickImageDialog(context,
            (double? maxWidth, double? maxHeight, int? quality) async {
          try {
            final XFile? pickedFile = await _picker.pickImage(
              source: source,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality,
            );
            setState(() {
              _setImageFileListFromFile(pickedFile);
            });
          } catch (e) {
            setState(() {
              _pickImageError = e;
            });
          }
        });
      }
    }
  }
   Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_mediaFileList != null) {
      return Semantics(
          label: 'image_picker_example_picked_images',
        child: ListView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            final String? mime = lookupMimeType(_mediaFileList![index].path);

            return Container(
              decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        padding: const EdgeInsets.all(8.0),
        child: Semantics(
              label: 'image_picker_example_picked_image',
              child: kIsWeb
                  ? Image.network(_mediaFileList![index].path)
                  : (mime == null || mime.startsWith('image/')
                      ? SizedBox(
                        width:300.0,
                        height:300.0,
                        child: Image.file(
                          File(_mediaFileList![index].path),
                          fit: BoxFit.contain,
                          errorBuilder: (BuildContext context, Object error,
                           StackTrace? stackTrace) {
                            return const Center(
                                child:
                                    Text('This image type is not supported'));
                          },
                        )
                        )
                      : const SizedBox.shrink()),
             )
             );
          },
          itemCount: _mediaFileList!.length,
        ),
        
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
         'You have not yet picked an image.\n Make sure to fill all the fields before taking or uploading a picture if any',
        textAlign: TextAlign.center,
      );
    }
  }
  Widget _handlePreview() {
   
      return _previewImages();
    
  }
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
       {
        isVideo = false;
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _mediaFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }
  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
  Future<void> _displayPickImageDialog(
      BuildContext context,onPick)async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('UPLOAD A PICT'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
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
          
          Center(
            child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _handlePreview();
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',

                          textAlign: TextAlign.center,
                          
                        );
                        
                      }
                  }
                },
              )
            : _handlePreview(),
          ),
          _formWidget(),
          
        ],
        
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                    isVideo = false;
                    _onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                  isMultiImage: true,
                );
                  }
                isVideo = false;
               
              },
              heroTag: 'image1',
              tooltip: 'Pick Multiple Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          ),
          if (_picker.supportsImageSource(ImageSource.camera))
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    isVideo = false;
                    _onImageButtonPressed(ImageSource.camera, context: context);
                  }
                  
                },
                heroTag: 'image2',
                tooltip: 'Take a Photo',
                child: const Icon(Icons.camera_alt),
              ),
            ),
        ],
      ),

    );
  }
  Widget _formWidget() {
    const maxlines = 3;
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30.0,),
                          
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
                            controller: controllerPosti,
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
                            controller: controllerSpecialityi,
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
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
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
    ); 
  }
}