import 'package:flutter/material.dart';
enum complexity{
simple,challenge,hard

}

class Category{

  @required final String id;
  @required final String title;
  @required final color ;
  const Category({this.id,this.title,this.color});

}