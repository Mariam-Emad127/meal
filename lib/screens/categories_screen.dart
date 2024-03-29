import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import 'package:mealappl/dummy_data.dart';
class Categories_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(title:Text( "Meal"),),
      body: GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((e) =>
        Category_item(e.id, e.title,e.color),
        ).toList(),

         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
           maxCrossAxisExtent: 200,
           childAspectRatio: 3/2,
             crossAxisSpacing: 20,
           mainAxisSpacing: 20,

         ),


      ),
    );
  }
  
  
  
  
}