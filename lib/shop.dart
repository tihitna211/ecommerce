import 'package:ecom/settings/pp.dart';
import 'package:ecom/thedetails.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> imagePaths = [
    'assets/girli.jpg',
    'assets/shoe.jpg',
    'assets/shoe1.jpg',
    'assets/shoe2.jpg',
    'assets/shoo2.jpg',
    'assets/shoo5.jpg',
    'assets/shooo3.jpg'
  ];
  List<String> name = [
    'flowery heels',
    'jordan',
    'adidas',
    ' nike',
    'sports shoe',
    'puma',
    'ergendo'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('shoply'),
        ),
        drawer: Drawer(
          child: Column(children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: AssetImage('assets/shoo2.jpg'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return profileEdit();
                })));
              },
              title: Text('profile'),
            ),
            ListTile(
              title: Text('dashboard'),
            ),
            ListTile(
              title: Text('cart'),
            ),
            ListTile(
              title: Text('setting'),
            )
          ]),
        ),
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TheDetails(
                        name: name[index % name.length].toString(),
                        image: imagePaths[index % imagePaths.length],
                      );
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset(
                      imagePaths[index % imagePaths.length],
                      fit: BoxFit.cover,

                      //Text(title[index % title.length].toString()),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(name[index % name.length]),
                  trailing: Icon(Icons.favorite),
                  subtitle: Column(
                    children: [Text('data'), Text('price= 3000')],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
