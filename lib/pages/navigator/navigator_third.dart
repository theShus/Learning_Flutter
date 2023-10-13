import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Third"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Text("Third page"));
  }

  //todo postavi MVC za mozda note keeping ili tasks

}