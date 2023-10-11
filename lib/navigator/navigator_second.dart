import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second"),
        backgroundColor: Colors.red,
      ),
      body: Text("Second page"),
    );
  }

}