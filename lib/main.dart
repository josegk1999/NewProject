import 'package:flutter/material.dart';
import 'package:wetffsolution/constants.dart';

import 'Home.dart';
import 'Profile_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: new Scaffold(
            body: TabBarView(children: [
              HeaderHome(size: size),
              new Container(
                color: Colors.black,
                child: Stack(children: <Widget>[
                  Container(
                    height: size.height * 0.2 - 27,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36)),
                    ),
                  )
                ]),
              ),
              Profile_Settings(size: size),
            ]),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                child: SizedBox(
                  height: 60,
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.home),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.mail),
                        label: "Messages"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: "Search"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notifications),
                          label: "Notification"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: "Profile")
                    ],
                    backgroundColor: Colors.indigo.shade900,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white30,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
