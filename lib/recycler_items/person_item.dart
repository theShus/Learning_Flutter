import 'package:flutter/material.dart';
import 'package:learning_demo/pages/profile_page.dart';
import '../models/person.dart';

class PersonItem extends StatelessWidget {
  final Person person;
  // Image profileImage;

  /* IMPORTANT CONSTRUCTOR KNOWLEDGE
  // Consts(item1, [item2]) - [] znaci da je item2 opcioni i ne mora da se prosledi pri keraciji
  // Consts(item1, {item2}) - {} znaci da je item2 opcioni I TAKODJE ako se prosledi mora da mu se prosledi ime new const(X, item2: Y)
   */
  PersonItem({Key? key, required this.person}):
        // profileImage = Image.network(person.imageUrl),
        super(key: key);

  //Originally was InkWell with the ListTile inside, think this is redundant and can be just ListItem
  //InkWell is used when you want an interactive area (button, list item, card...)
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(person.imageUrl), radius: 30),
      title: Text(person.name + " " + person.last),
      subtitle: Text(person.country),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfilePage(person: person))),
    );
  }
}
