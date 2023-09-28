import 'package:flutter/material.dart';
import 'package:mealappl/dummy_data.dart';
import 'package:mealappl/module/meal.dart';
import '../widgets/meal_item.dart';

class  CategoryMealScreen extends StatefulWidget {

  static const routeName='category_meal';
  final List<Meal> avilablemeal;

  const CategoryMealScreen(  this.avilablemeal )  ;

  @override
   CategoryMealScreenState createState() => CategoryMealScreenState();
}

class  CategoryMealScreenState extends State< CategoryMealScreen> {
String categorytitle;
List displayMeal;
@override
  void didChangeDependencies() {
  final routearg=ModalRoute.of(context).settings.arguments as Map<String,String>;
  final categoryid=routearg['id'];
  categorytitle=routearg['title'];
  displayMeal=widget.avilablemeal.where((meal)  {
    return meal.categories.contains(categoryid);
  }).toList();

  super.didChangeDependencies();
  }


  void removeMeal  (String mealId){
setState(() {
  displayMeal.removeWhere((meal) => meal.id==mealId);
});
  }
  @override
  Widget build(BuildContext context) {
    final routearg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryid=routearg['id'];
    final categorytitle=routearg['title'];
    final categryMeals=DUMMY_MEALS.where((meal)  {
  return meal.categories.contains(categoryid);
}).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle),),
body: ListView.builder(
    itemBuilder: (ctx,index){
return  Meal_item(
    imageUrl: displayMeal[index].imageUrl,
        id: displayMeal[index].id,
        title: displayMeal[index].title,
  duration: displayMeal[index].duration,
    complexity: displayMeal[index].complexity,
  affordability: displayMeal[index].affordability,
 // removeItem: removeMeal,
);
    },
  itemCount:categryMeals.length ,
    ),
    );
  }
}
