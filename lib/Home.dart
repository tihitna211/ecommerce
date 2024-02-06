import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('welcome'),
          ),
          body:  Column(
            children: [
              Text("NAME"),
              Container(
                width: MediaQuery.of(context).size.width*0.68,
                 child: TextField(
                 autocorrect: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                      
                          color: Colors.deepPurple,
                          width: MediaQuery.of(context).size.width*0.98 ,
                          style: BorderStyle.solid),
                      ),
                    ),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
