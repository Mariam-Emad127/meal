import 'package:flutter/material.dart';
import 'package:mealappl/module/meal.dart';
import 'package:mealappl/screens/categories_screen.dart';
import 'package:mealappl/screens/favorite.dart';
import 'package:mealappl/widgets/main_drawer.dart';
class TabeScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
    TabeScreen(  this .favoriteMeals );


  @override
  _TabeScreenState createState() => _TabeScreenState();
}

class _TabeScreenState extends State<TabeScreen> {
  List<Map<String,Object>>_pages;
int selectedPageindex=0;
@override
  void initState() {
  _pages=[
    {'page':Categories_screen(),
      'title':"categores"
    },

    {
      'page':favoriteScreen(widget.favoriteMeals ),
      'title':"your meal"
    },
  ];
    super.initState();
  }
  void selectpage(int value){
setState(() {
  selectedPageindex=value;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(_pages[selectedPageindex]['title'])),
      body:_pages[selectedPageindex]['page'],
      //_page[selectedPageindex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectpage,
backgroundColor: Theme.of(context).primaryColor,
selectedItemColor: Theme.of(context).accentColor,
unselectedItemColor: Colors.white,
currentIndex: selectedPageindex,
items: [
BottomNavigationBarItem(
    icon:Icon(Icons.category),
title: Text("categories")

),
    BottomNavigationBarItem(
    icon:Icon(Icons.star),
    title: Text("favorite")
    ),

  
],

      ),
      drawer:MainDrawer(),
    );
  }
}
