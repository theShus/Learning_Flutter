import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text("Third page")),
    );
  }
}
