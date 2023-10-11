import 'package:flutter/material.dart';
import 'package:learning_demo/RestClient.dart';
import 'package:learning_demo/recyclerItems/personItem.dart';

import '../models/person.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _loading = false;
  List<Person> _people = [];

  void _initPeople() async {
    setState(() {
      _loading = true;
    });

    //todo why is await removing the cast error, it doesnt care about casting to List anymore
    List<Person> newPeopleData = await RestClient().getPeople(25);

    setState(() {
      _people = newPeopleData;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("People list"),
          backgroundColor: Colors.blue,
        ),
        body: _people.length > 0
            ? ListView(
                children: _people.map((person) => PersonItem(person: person)).toList(),
              )
            : Center(
                child: _loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () { //if I would put onPressed: _initPeople  that would bind the function to the click
                          _initPeople(); //and instead here we are calling the function
                        },
                        child: Icon(Icons.downloading)),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("!"),
          //todo make it do something, maybe a new page for a custom person
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ));
  }
}
