import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonItem extends StatelessWidget {
  final Person person;

  // final Image profileImage;

  PersonItem({Key? key, required this.person})
      :
        // profileImage = Image.network(person.imageUrl),
        super(key: key);

  //todo zasto ako postavim {} ispod konstruktora idalje racuna kao da profileImage nije tu inicijalizovan nego se buni

  //Originally was InkWell with the ListTile inside, think this is redundant and can be just ListItem
  //InkWell is used when you want an interactive area (button, list item, card...)
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(person.imageUrl), radius: 30),
      title: Text(person.name + " " + person.last),
      subtitle: Text(person.country),
      onTap: () => print(person.imageUrl), //todo otvori novu starnicu
    );
  }
}
