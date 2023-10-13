import 'package:flutter/material.dart';
import 'package:learning_demo/rest_client.dart';
import 'package:learning_demo/recycler_items/person_item.dart';

import '../../models/person.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
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
          title: const Text("People regular"),
          backgroundColor: Colors.blue,
        ),
        body: _people.length > 0
            ? ListView(
                children: _people.map((person) => PersonItem(person: person)).toList(),
              )
            : Center(
                child: _loading
                    ? CircularProgressIndicator()
                    : OutlinedButton(
                        onPressed: () { //if I would put onPressed: _initPeople  that would bind the function to the click
                          _initPeople(); //and instead here we are calling the function
                        },
                        child: Icon(Icons.refresh)),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("!"),
          //todo make it do something, maybe a new page for a custom person
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ));
  }
}
