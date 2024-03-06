import 'package:ecom/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderPage();
  }
}
//git init ... initiate git
// git remote add origin your_repo_link ... connect ur folder to a git repo
// git branch -M main ... create a branch named main
// git add . add al local files and make them ready
// git commit -m "add comment" ... commit changes to be uploaded to github
// git push origin main ... upload changes