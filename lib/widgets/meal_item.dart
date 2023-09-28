import 'package:flutter/material.dart';
import 'package:mealappl/module/category.dart';
import 'package:mealappl/screens/meal_detail_screen.dart';
import '../module/meal.dart';
class Meal_item extends StatelessWidget {
final String imageUrl;
final String title;
final String id;
final Complexity complexity;
final Affordability affordability;
final int duration;
//final Function removeItem;

  const Meal_item({
    @required this.imageUrl,
    @required this.title,
    @required this.id,
    @required  this.complexity,
    @required this.affordability,
    @required this.duration,
   // @required this.removeItem,
  })  ;

 String get complexityText{
switch(complexity){
  case Complexity.Simple :return 'simple '; break;
  case Complexity.Challenging :return 'simple '; break;
  case Complexity.Hard :return 'simple '; break;
  default :return 'unknwon' ;break;
}
 }
 String get AffordabilityText{
switch(affordability){
case Affordability.Affordable :return 'Affordable '; break;
case Affordability.Luxurious :return 'Luxurious '; break;
case Affordability.Pricey :return 'Pricey '; break;
default :return 'unknwon' ;break;
}

 }

    void selectedMeal(BuildContext ctx){
Navigator.of(ctx).pushNamed(MealDeatailScreen.routeName,
  arguments: id,

).then((result)  {
 //  if(result != null) removeItem(result);
  });
 }
    @override
    Widget build(BuildContext context) {

    return InkWell(
      onTap:()=>selectedMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius :BorderRadius.circular(15)
        ),
        elevation: 20,
margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius:BorderRadius.only(
                 //:BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),

      ),
        child: Image.network(imageUrl),
  ),
                 Positioned(
                   bottom: 20,
                   right: 10,
                   child:Container(
                   width: 220,
                   color: Colors.black54,
                   padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                   child: Text(title,style: TextStyle(color: Colors.white,fontSize:25),
                   softWrap: true,
                     overflow: TextOverflow.fade,
                   ),
                 )

                 ),
              ],




            ),
            Padding(padding:EdgeInsets.all(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
            children:[
                Icon(Icons.schedule),
                  SizedBox( width: 4,),
                  Text("$duration mim"),
],
                ),
                Row(
                children:[
                  Icon(Icons.work),
                  Text("$complexityText"),
],
                ),
                Row(
                    children:[
                  Icon(Icons.attach_money),
                  Text("$AffordabilityText"),
],
                )
              ],

            ),
            ),

          ],
        ),


      ),
    );
  }
}


