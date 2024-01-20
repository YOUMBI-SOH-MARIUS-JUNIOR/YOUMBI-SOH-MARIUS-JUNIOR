// ignore_for_file: file_names, deprecated_member_use, avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/screens/AI.dart';
import 'package:project1/screens/Guest.dart';
import 'package:project1/screens/Guest/SignupScreen/SignUp.dart';

import 'package:project1/screens/Guest/navigation/home.dart';
import 'package:project1/screens/Guest/navigation/job.dart';
import 'package:project1/screens/Guest/navigation/network.dart';
import 'package:project1/screens/Guest/navigation/notification.dart';
import 'package:project1/screens/Guest/navigation/post.dart';
import 'package:project1/screens/pub.dart';
import 'package:project1/screens/publication.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  
  const NavigationScreen({super.key,
    
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  String _imagePath='';
  Future<void> _selectImageFromGallery()async{
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source:ImageSource.gallery);
    if(pickedImage !=null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }
   
late List<BottomNavigationBarItem> _item; 
  int currentPage = 0;
  List<Widget> pages = const [
    HomeScreen(),
    NetworkScreen(),
    PostScreen(),
    NotificationScreen(),
    JobScreen()
  ];
  
  
@override
  void initState() {
    super.initState();
_item =[];
    _item.add(const BottomNavigationBarItem( label:'Home',icon: Icon(Icons.home, size: 28, color: Color.fromARGB(255, 19, 165, 68),)));
    _item.add( const BottomNavigationBarItem(label:'My Network',icon: Icon(Icons.group,size: 28, color:Color.fromARGB(255, 19, 165, 68))));
    _item.add( const BottomNavigationBarItem(label:'Councour',icon: Icon(Icons.text_snippet,size: 28,color: Color.fromARGB(255, 19, 165, 68))));
    _item.add( const BottomNavigationBarItem(label:'Notification',icon: Icon(Icons.notifications,size: 28,color: Color.fromARGB(255, 19, 165, 68))));
    _item.add( const BottomNavigationBarItem(label:'Job',icon: Icon(Icons.work_rounded,size: 28,color: Color.fromARGB(255, 19, 165, 68))));
    
  }

  @override
  Widget build(BuildContext context) {
    final counterModel=Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Freedom'.toUpperCase(),
          style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
            IconButton(
              icon: const Icon(
                Icons.design_services_sharp,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {
              },
            ),
            
          ],
        ),
      
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(accountName: Text(counterModel.Name),
             accountEmail:Text(counterModel.email,),
             
            currentAccountPicture: CircleAvatar(
              backgroundImage: _imagePath.isNotEmpty?FileImage(File(_imagePath)):null,
              child:_imagePath.isEmpty? IconButton(icon: const Icon(Icons.add_a_photo),onPressed: _selectImageFromGallery,) :null,
             
            ),
            otherAccountsPictures: [
              IconButton(onPressed: _selectImageFromGallery, icon: const Icon(Icons.edit)),
            ],
            
            ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.home),
            title: const Text('Home \n Accueil'),
            onTap: () =>{}
            
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.on_device_training_rounded),
            title: const Text('Internship \n Stage'),
            onTap: () => {} ,
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.work),
            title: const Text('Recrutement '),
            onTap: () => {}
          ),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.text_snippet),
            title: const Text('concours '),
            onTap: () => {}
          ),

        
        const Divider(),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            title: const Text('About Us'),
            leading: const Icon(Icons.info_outline),
            onTap: ()  {}
          ),  
         
          
          const Divider(),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuestScreen(),
                      ),
                      (route) => false,
                    );
            }
          ),
        ],
      ),
      
    ),
    body: pages[currentPage],
   bottomNavigationBar: BottomNavigationBar(
    selectedItemColor: const Color(0xFFFE9901),
      items: _item,
      currentIndex: currentPage,
      onTap: (int index){
        setState(() {
        currentPage = index;
        
        });
      },
      
      

      ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: const PubScreen(),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const PublicationScreen()));
              },
              
              child: const Icon(Icons.add,size: 40.0,),
            ),
          ),
          
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                heroTag: AIscreen,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AIscreen()));
                },
                child: const Icon(Icons.school),
              ),
            ),
        ],
      ),
      
    
    );
  }

  
}

