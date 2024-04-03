import 'package:carousel_slider/carousel_slider.dart';
//import 'package:carousel_slider/utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecom/Home.dart';
import 'package:ecom/shop.dart';
import 'package:ecom/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliderPage extends StatefulWidget {
  SliderPage({
    super.key,
  });

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final url = 'assets/girli.jpg';

  final urlImages = [
    'assets/girli.jpg',
    'assets/shoe.jpg',
    'assets/shoe1.jpg',
    'assets/shoe2.jpg',
    'assets/shoo2.jpg',
    'assets/shoo5.jpg',
    'assets/shooo3.jpg'
  ];
  int activeindes = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(23),
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid)),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Shop();
                              }));
                            },
                            child: Text('skip'),
                          ))
                    ],
                  ),
                  CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.78,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 1),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() => activeindes = index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DotsIndicator(
                    dotsCount: urlImages.length,
                    position: activeindes,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        elevation:
                            BouncingScrollSimulation.maxSpringTransferVelocity,
                        shape: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black87,
                        ),
                        padding: EdgeInsets.all(8.0),
                        color: Color.fromARGB(255, 47, 55, 84),
                        autofocus: true,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        child: Text('signup'),
                      ),
                      MaterialButton(
                        elevation:
                            BouncingScrollSimulation.maxSpringTransferVelocity,
                        shape: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black87,
                        ),
                        padding: EdgeInsets.all(8.0),
                        color: Color.fromARGB(255, 47, 55, 84),
                        autofocus: true,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        },
                        child: Text('login'),
                      )
                    ],
                  ),
                ],
              ),
            ));
      }),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        color: Colors.grey,
        margin: EdgeInsets.all(10.0),
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
