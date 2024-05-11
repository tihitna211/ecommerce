import 'package:ecom/shop.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<void> saveUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
  }

  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool VisibleText = true;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/girli.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('signup')],
            ),
            SizedBox(height: 70),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: fullnameController,
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
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: usernameController,
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
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: emailController,
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
            SizedBox(height: 10),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.15,
              child: TextField(
                controller: passwordController,
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
                  } else {
                    setState(() {
                      error = "good!";
                    });
                  }
                },
                decoration: InputDecoration(
                  errorText: error,
                  errorStyle: TextStyle(
                      color: (error == 'good')
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
                    icon: Icon(VisibleText
                        ? Icons.visibility
                        : Icons.visibility_off_outlined),
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
            MaterialButton(
              color: Colors.grey,
              autofocus: true,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Shop(username: usernameController.text);
                }));
              },
              child: Text('signup'),
            )
          ],
        ),
      ),
    );
  }
}
