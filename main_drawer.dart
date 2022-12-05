import 'package:flutter/material.dart';
import 'package:mealappl/screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildlistTitle(String title,IconData icon,Function tapHandler){
   return ListTile(
     leading: Icon (icon ,size: 26,)  ,
     title: Text(title,style: TextStyle(
       fontSize: 24,
       fontFamily: 'RobotoCondensed',
       fontWeight: FontWeight.bold,
     ),
     ),
     onTap: tapHandler,
   );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
           padding:  EdgeInsets.all(20),
           alignment: Alignment.centerLeft,
           child: Text("cooking Up",
           style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,
           color: Theme.of(context).primaryColor),

           ),

        ),
          SizedBox(height: 30,),
          buildlistTitle("meal", Icons.restaurant,
                  (){Navigator.of(context).pushReplacementNamed( '/');}),
          buildlistTitle( "filter", Icons.settings,
                  (){Navigator.of(context).
                  pushReplacementNamed( FiltersScreen.routerName);})
        ],

      ),




    );
  }
}
