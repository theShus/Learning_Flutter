import 'package:flutter/material.dart';
import 'package:learning_demo/pages/navigator/people_page.dart';
import 'package:learning_demo/pages/navigator/people_page_bloc.dart';
import 'package:learning_demo/pages/navigator/tasks_page.dart';
import 'package:learning_demo/pages/navigator/third_page.dart';

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
  final List<Color> pageColors = [Colors.blue, Colors.orangeAccent, Colors.deepPurple];
  final screens = [
    PeoplePage(),
    TasksPage(),
    ThirdPage()
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
          body: IndexedStack( // body: screens[pageIndex], NE MOZE SAMO LISTA JER NE CUVA DECU ZIVU U WIDGET TREE
          index: currentPageIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: pageColors[currentPageIndex],
            items: const [
              BottomNavigationBarItem(
                  label: "First",
                  icon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  label: "Second",
                  icon: Icon(Icons.nature_people)),
              BottomNavigationBarItem(
                  label: "Third",
                  icon: Icon(Icons.list_alt)),
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
