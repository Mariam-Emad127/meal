import 'package:flutter/material.dart';
import 'package:mealappl/module/meal.dart';
import 'package:mealappl/widgets/meal_item.dart';
class favoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  favoriteScreen(  this .favoriteMeals );

  @override
  Widget build(BuildContext context) {
 if(favoriteMeals.isEmpty ) {
   return Center(
     child: Text("favorite"),

   );
 }
 else{
   return ListView.builder(
     itemBuilder: (ctx,index){
       return  Meal_item(
         imageUrl: favoriteMeals[index].imageUrl,
         id: favoriteMeals[index].id,
         title: favoriteMeals[index].title,
         duration: favoriteMeals[index].duration,
         complexity: favoriteMeals[index].complexity,
         affordability: favoriteMeals[index].affordability,
         //removeItem: removeMeal,
       );
     },
     itemCount:favoriteMeals.length ,
   );

 }
  }
}
