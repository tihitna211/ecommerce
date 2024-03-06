import 'package:ecom/shop.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool VisibleText = true;

  var error = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/girli.jpg'))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                            color: Colors.black, style: BorderStyle.solid)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text('skip'),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('signup')],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'fullname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: email,
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
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
            MaterialButton(
              color: Colors.grey,
              autofocus: true,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Shop();
                }));
              },
              child: Text('signup'),
            )
          ]),
        ),
      ),
    );
  }
}
