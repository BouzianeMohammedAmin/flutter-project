import 'package:first_project/models/nav_menu.dart';
import 'package:first_project/screens/head_line_news.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/twiter_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("Head Line News", () => HeadLineNews()),
    NavMenuItem("TWITTER FEED", () => TwitterFeed()),

  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 24, top: 75),
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(
              navMenu[position].title,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 22,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return navMenu[position].destination();
              }));
            },
          );
        },
        itemCount: navMenu.length,
      ),
    );
  }
}
