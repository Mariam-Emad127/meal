import 'package:flutter/material.dart';
import 'package:mealappl/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routerName = '/filter';
  final Function savefilter;
 // final Map<String, bool> currentfilter;

  FiltersScreen(  this.savefilter);
//this.currentfilter
  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
/*

  @override
  initState() {
    _glutenFree = widget.currentfilter['gluten'];
    _vegan = widget.currentfilter['vegan'];
    _vegetarian = widget.currentfilter['vegetarian'];
    _lactoseFree = widget.currentfilter['lactose'];
    super.initState();
  }
*/

  Widget buildSwitsh(
      String title, String subTile, bool current_value, Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTile),
      value: current_value,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your filters"),
        actions: [
          IconButton(
            icon: (Icon(Icons.save)),
            onPressed: () {
              final Map<String, bool> selectedfilter = {
                'gluten ': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose ': _lactoseFree,
              };
              widget.savefilter(selectedfilter);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("add your meal selection",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitsh(
                "isGlutenFree",
                "only inclde  GlutenFree",
                _glutenFree,
                (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                },
              ),
              buildSwitsh(
                "Vegan",
                "only inclde  Vegan",
                _vegan,
                (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                },
              ),
              buildSwitsh(
                "Vegetarian",
                "only inclde  Vegetarian",
                _vegetarian,
                (newvalue) {
                  setState(() {
                    _vegetarian = newvalue;
                  });
                },
              ),
              buildSwitsh(
                "LactoseFree",
                "only inclde  LactoseFree",
                _lactoseFree,
                (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
      //Navigator.of(context).pop()
    );
  }
}
