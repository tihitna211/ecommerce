import 'package:ecom/shop.dart';
import 'package:flutter/material.dart';

class TheDetails extends StatelessWidget {
  var name;
  var image;
  var username;
  TheDetails({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Shop(username: username.text);
                    }));
                  },
                  icon: Icon(Icons.arrow_back))),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.67,
                width: MediaQuery.of(context).size.width * 0.76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              ListTile(
                title: Text(name),
                subtitle: Text('price =' + ''),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                height: MediaQuery.of(context).size.height * 0.069,
                minWidth: MediaQuery.of(context).size.width * 0.89,
                onPressed: () {},
                child: Text('add to cart'),
              )
            ],
          ),
        ));
  }
}//the cart , theme shared preference laravel
