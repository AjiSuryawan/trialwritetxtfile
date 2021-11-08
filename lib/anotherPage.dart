import 'package:flutter/material.dart';

class anotherpage extends StatefulWidget {
  const anotherpage({Key? key}) : super(key: key);

  @override
  _anotherpageState createState() => _anotherpageState();
}

class _anotherpageState extends State<anotherpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("coba"),),
      body: Center(child: Container(
        child: Text("landing page"),
      ),),
    );
  }
}
