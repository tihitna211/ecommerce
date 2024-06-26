import 'package:ecom/shop.dart';
import 'package:ecom/signup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool VisibleText = true;

  var error = "";
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            //backgroundColor: Colors.blueGrey,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/girli.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
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
                                    return Shop(
                                      username: username.text,
                                    );
                                  }));
                                },
                                child: Text('skip'),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('login')],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 19),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Expanded(
                        child: TextField(
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
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {}, child: Text('forget pasword?'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Shop(username: username.text);
                            }));
                          },
                          icon: Icon(
                            Icons.arrow_circle_right_rounded,
                            size: 70,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('dont have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text('sign up'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
