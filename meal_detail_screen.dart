import 'package:flutter/material.dart';
import 'package:mealappl/dummy_data.dart';

class MealDeatailScreen extends StatelessWidget {
 static const routeName='meal_detail';
 final Function tagleFavorite;
 final Function isFavorite;

    MealDeatailScreen( this.tagleFavorite, this.isFavorite )  ;

 Widget buildSectionTitle(BuildContext context,String text){
   return Container(
     margin: EdgeInsets.symmetric(vertical:10),
     child: Text(text,style: Theme.of(context).textTheme.title),
   );
 }
 Widget buildContainer(Widget child){
   return Container(
     decoration: BoxDecoration(
       border: Border.all(color: Colors.grey),
       borderRadius: BorderRadius.circular(10),
       color: Colors.white,

     ),
     margin: EdgeInsets.all(10),
     padding:EdgeInsets.all(10) ,
     height: 200,
     width: 300,

     child: child,

   );
 }
 // const MealDeatailScreen( ) ;

  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments  as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) =>  meal.id==mealId);
    return Scaffold(
appBar: AppBar(
  title: Text(mealId),
),
body:SingleChildScrollView(
child: Column(
 children: [
Container(
  height: 300,
  width: double.infinity,
  child: Image.network( selectedMeal.imageUrl),

),
   buildSectionTitle(context, "ingredient"),
   buildContainer(ListView.builder(
  itemBuilder:(ctx,index)=>Card(
      color: Theme.of(context).accentColor,
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Text(selectedMeal.ingredients[index]),
      )

  ),



  itemCount: selectedMeal.ingredients.length,
),),
  buildSectionTitle(context, "steps"),

buildContainer(ListView.builder(
  itemBuilder:(ctx,index)=>ListTile(
leading:CircleAvatar(
  child: Text("#${index+1}"),
) ,

title: Text(selectedMeal.steps[index]),
  ),
      itemCount: selectedMeal.ingredients.length,

)),

 ],

),
),
      floatingActionButton: FloatingActionButton(
onPressed:()=>tagleFavorite(mealId),
    //(){Navigator.of(context).pop();},
        child:Icon(isFavorite(mealId) ? Icons.star :Icons.star_border),

      ),
    );

  }
}

