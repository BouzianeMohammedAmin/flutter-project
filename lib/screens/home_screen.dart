import 'package:first_project/screens/home_tabs/favorites.dart';
import 'package:first_project/screens/home_tabs/popular.dart';
import 'package:first_project/screens/home_tabs/whats_new.dart';
import 'package:first_project/shread_ui/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
 TabController _tabController ;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController( initialIndex: 0, length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search ), onPressed: (){

          }),
          IconButton(icon: Icon(Icons.more_vert ), onPressed: (){

          }),
        ],
        bottom: TabBar(tabs: [
          Tab(text: "WHAT'S NEW",),
          Tab(text: "POPULAR",),
          Tab(text: "FAVORITES",),
        ] ,
        indicatorColor: Colors.white,
        controller: _tabController,),
      ),
      body: Center(
        child:TabBarView(children: [
          WhatsNaw(),
          Popular(),
          Favotites(),
        ],
        controller: _tabController,),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
