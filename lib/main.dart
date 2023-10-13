import 'package:flutter/material.dart';
import 'package:learning_demo/pages/navigator/navigator_people.dart';
import 'package:learning_demo/pages/navigator/navigator_people_bloc.dart';
import 'package:learning_demo/pages/navigator/navigator_tasks.dart';

void main() {
  runApp(const MyAppNavigator());
}

class MyAppNavigator extends StatefulWidget {
  const MyAppNavigator({super.key});
  @override
  State<MyAppNavigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<MyAppNavigator> {
  int currentPageIndex = 0;
  final screens = [
    PeoplePage(),
    SecondPeoplePage(),
    TasksPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Learning Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Scaffold(
          // body: screens[pageIndex], NE MOZE SAMO LISTA JER NE CUVA DECU ZIVU U WIDGET TREE
          body: IndexedStack(
            index: currentPageIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting, //todo stavi da je fixed ali da menja boju
            //ako bude default ili static mozes da stavis global background color
            items: const [
              BottomNavigationBarItem(
                  label: "First",
                  icon: Icon(Icons.people),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  label: "Second",
                  icon: Icon(Icons.nature_people),
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  label: "Third",
                  icon: Icon(Icons.list_alt),
                  backgroundColor: Colors.deepPurple),
            ],
            currentIndex: currentPageIndex,//current index is what is selected currently
            onTap: (int clickedPageIndex) {
              setState(() {
                currentPageIndex = clickedPageIndex;
              });
            },
          ),
        ));
  }
}
