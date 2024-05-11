import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

//import 'package:shared_preferences/shared_preferences.dart'

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileEdit extends StatefulWidget {
  const profileEdit({super.key});

  @override
  State<profileEdit> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  Future<void> saveUserDetails(
      String username, String password, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  final ImagePicker picker = ImagePicker();
  XFile? image;
  void imagegal() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void imagecam() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void showimage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Text('pick image'),
                  ListTile(
                    onTap: () {
                      imagecam();
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.camera),
                    title: Text('from camera'),
                  ),
                  ListTile(
                    onTap: () {
                      imagegal();

                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.browse_gallery),
                    title: Text('from gallery'),
                  ),
                  TextButton(
                    child: Text('cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )),
        );
      },
    );
  }

  bool VisibleText = true;
  var error = "";

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }

  Future<void> _fetchSessionAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    if (username != null && password != null && email != null) {
      // Navigate to home screen
    } else {
      // Navigate to login screen
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Container(
            height: 300,
            child: Center(
              child: Stack(
                children: [
                  (image != null)
                      ? CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(
                            File(image!.path),
                          ),
                        )
                      : CircleAvatar(
                          radius: 90,
                          child: Icon(
                            Icons.person_2,
                          ),
                        ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {
                        return showimage(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'username',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: username,
                decoration: InputDecoration(hintText: 'username'),
              ),
              Text(
                'email',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'email'),
              ),
              Text(
                'password',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: password,
                obscureText: VisibleText,
                onChanged: (value) {
                  if (value.length < 8) {
                    setState(() {
                      error = "too short";
                    });
                  } else if (value.length >= 8 && value.length < 12) {
                    setState(() {
                      error = "medium";
                    });
                  }
                  // ignore: curly_braces_in_flow_control_structures
                  else {
                    setState(() {
                      error = "good!";
                    });
                  }
                  ;
                },
                decoration: InputDecoration(
                  errorText: error,
                  errorStyle: TextStyle(
                      color: (error == 'good!')
                          ? Colors.green
                          : (error == "too short")
                              ? Colors.red
                              : (error == 'medium')
                                  ? Colors.amber
                                  : null),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        VisibleText = !VisibleText;
                      });
                    },
                    icon: Icon((VisibleText)
                        ? Icons.visibility
                        : (!VisibleText)
                            ? Icons.visibility_off_outlined
                            : null),
                  ),
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  _fetchSessionAndNavigate();
                },
                child: Text('update'),
                shape: Border.all(color: Colors.transparent),
              )
            ],
          )
        ],
      )), //positioned(icon,bottom, left)
    );
  }
}
//
// Obtain shared preferences.
// final SharedPreferences prefs = await SharedPreferences.getInstance();

// // Save an integer value to 'counter' key.
// await prefs.setInt('counter', 10);
// // Save an boolean value to 'repeat' key.
// await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
// await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
// await prefs.setString('action', 'Start');
// // Save an list of strings to 'items' key.
// await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
// final int? counter = prefs.getInt('counter');
// // Try reading data from the 'repeat' key. If it doesn't exist, returns null.
// final bool? repeat = prefs.getBool('repeat');
// // Try reading data from the 'decimal' key. If it doesn't exist, returns null.
// final double? decimal = prefs.getDouble('decimal');
// // Try reading data from the 'action' key. If it doesn't exist, returns null.
// final String? action = prefs.getString('action');
// // Try reading data from the 'items' key. If it doesn't exist, returns null.
//final List<String>? items = prefs.getStringList('items');