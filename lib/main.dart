import 'package:flutter/material.dart';
import 'package:mealappl/screens/filters_screen.dart';
import 'package:mealappl/screens/meal_detail_screen.dart';
import 'package:mealappl/screens/tabe_screen.dart';
import './screens/categoy_meal_screen.dart';
import 'dummy_data.dart';
import 'module/meal.dart';
import './screens/categories_screen.dart';
import 'package:mealappl/widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten ': false,
    'vegan': false,
    'vegetarian': false,
    'lactose ': false,
  };
  List<Meal> avilablemeal = DUMMY_MEALS;
 List<Meal> _favoriteMeals=[];

  void setfilter(Map<String, bool> filtersda) {
    setState(() {
      filters = filtersda;
      avilablemeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        };

        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }
void _tagleFavorite(String mealId){
    final exsistIndex=_favoriteMeals.indexWhere((meal) => meal.id== mealId );
    if(exsistIndex>=0) {
      setState(() {
        _favoriteMeals.removeAt(exsistIndex);
      });
    }
    else{
      setState(() {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id== mealId ));
    });
    }

}
bool _isMeal(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
       
      routes: {
        '/': (context) => TabeScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(avilablemeal),
        MealDeatailScreen.routeName: (context) =>
            MealDeatailScreen(_tagleFavorite ,_isMeal ),
        FiltersScreen.routerName: (context) =>
            FiltersScreen( setfilter),
        //filters,
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mealApp"),
      ),
      body: null,
    );
  }
}
