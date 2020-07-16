import 'package:flutter/material.dart';

class PageModel{
  String title ;
  String description ;
  IconData icon ;
  String image ;

  PageModel({this.description,this.title, this.icon , this.image}):assert(description!=null && image != null && title!=null && icon !=null);

}