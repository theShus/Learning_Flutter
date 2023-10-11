import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_demo/models/person.dart';

class ProfilePage extends StatelessWidget {
  final Person person;

  ProfilePage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            elevation: 6,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!kIsWeb)
                  Flexible(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(person.imageUrl)),
                      ))
                else
                  SizedBox(height: 64, width: 64),
                Flexible(
                  flex: 7,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          person.name + " " + person.last,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Text(person.email)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Card(
            margin: EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "General information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),//WITH PADDING
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.wc,
                    size: 40,
                    color: Colors.blue,
                  ),
                  title: Text("Gender:"),
                  subtitle: Text(person.gender),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.cake,
                    size: 40,
                    color: Colors.blue,
                  ),
                  title: Text("Birthday:"),
                  subtitle: Text(DateFormat("dd/MM/yyyy").format(person.dob)),
                )
              ],
            ),
          ),
          Divider(),
          Card(
            margin: EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),//WITHOUT PADDING
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.map_outlined,
                    size: 40,
                    color: Colors.green,
                  ),
                  title: Text("Country:"),
                  subtitle: Text(person.country),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_city,
                    size: 40,
                    color: Colors.green,
                  ),
                  title: Text("City:"),
                  subtitle: Text(person.city),
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Contact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: 38,
                    color: Colors.black45
                  ),
                  title: Text("E-Mail:"),
                  subtitle: Text(person.email),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 38,
                    color: Colors.black45
                  ),
                  title: Text("Phone:"),
                  subtitle: Text(person.phone),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
