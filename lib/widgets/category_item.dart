import 'package:flutter/material.dart';
import '../screens/categoy_meal_screen.dart';
class Category_item extends StatelessWidget{
   final String id;
    final String title;
   final Color color ;
  Category_item(this.id,this.title,this.color);
   void selectcategory(BuildContext ctx){
Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
arguments: {
  'id':id,
  'title':title

}
);

   }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectcategory(context),
splashColor: Theme.of(context).primaryColor,
         borderRadius:BorderRadius.circular(15),
      
      child: Container(
        padding:EdgeInsets.all(15) ,
child: Text(title,style: Theme.of(context).textTheme.title,),

 decoration: BoxDecoration(
gradient: LinearGradient(
     colors:[
color.withOpacity(0.7),
           color,
     ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
),
borderRadius:BorderRadius.circular(15)
),




      ),
    );
  }

  
}