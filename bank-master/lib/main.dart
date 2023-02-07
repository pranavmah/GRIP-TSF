import 'package:flutter/material.dart';
import 'package:bank/home.dart';

void main() //manger for all app
{
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) //manager for class
  {
    return MaterialApp(
      //needs paramaters
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}