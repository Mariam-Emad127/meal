 //import 'package:flutter/material.dart';
enum Complexity{
 Simple,Challenging,Hard

}
enum Affordability{
 Affordable,Pricey,Luxurious
}

class Meal {
  final String id;
 final List<String> categories;
  final String title;
  final imageUrl;
   final color ;
  final Complexity complexity;
  final Affordability affordability;
 final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

const Meal({
 this.id,
 this.categories,
 this.title,
 this.color,
this.complexity,
 this.affordability,
 this.duration,
 this.imageUrl,
 this.ingredients,
 this.steps,
this.isGlutenFree,
 this.isLactoseFree,
 this.isVegan,
 this.isVegetarian
});
}