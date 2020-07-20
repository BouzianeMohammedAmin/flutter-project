import 'package:first_project/screens/onbording.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool( 'seen' )?? false ;
  Widget _screen;
  if( seen == false ){
    _screen = OnBoarding();
  }else{
    _screen = HomeScreen();
  }
  runApp( NewsApp( _screen ) );
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}