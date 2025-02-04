import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class Filters extends StatefulWidget {
  const Filters({super.key, required this.currentFilters});

  final Map<Filter,bool> currentFilters;
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  var _glutenfilter = false;
  var _lactosefilter = false;
  var _vegetarianfilter = false;
  var _veganfilter = false;

  @override
  void initState() {
   
    super.initState();
    _glutenfilter = widget.currentFilters[Filter.glutenFree]!;
    _lactosefilter = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianfilter = widget.currentFilters[Filter.vegetarian]!;
    _veganfilter = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.pop(context);
      //   if(identifier== 'meals'){
      //     Navigator.pushReplacement(context, 
      //     MaterialPageRoute(builder: (context)=>Tabs()));
      //   }
      // }),
      body: PopScope(
        canPop: false,
         onPopInvokedWithResult: (bool didPop, dynamic result) {
            if(didPop) return;
            Navigator.of(context).pop({
            Filter.glutenFree: _glutenfilter,
            Filter.lactoseFree: _lactosefilter,
            Filter.vegetarian: _vegetarianfilter,
            Filter.vegan: _veganfilter,
          });
    },
        child: Column(children: [
          SwitchListTile(
            value: _glutenfilter, 
            onChanged:(isChecked){
              setState(() {
                _glutenfilter = isChecked;
              });
            },
            title: Text('Glutten-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include glten free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
        
          SwitchListTile(
            value: _lactosefilter, 
            onChanged:(isChecked){
              setState(() {
                _lactosefilter = isChecked;
              });
            },
            title: Text('Lactose-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include lactose free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
        
              SwitchListTile(
            value: _vegetarianfilter, 
            onChanged:(isChecked){
              setState(() {
                _vegetarianfilter = isChecked;
              });
            },
            title: Text('Vegetarian', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include Vegetarian meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
        
              SwitchListTile(
            value: _veganfilter, 
            onChanged:(isChecked){
              setState(() {
                _veganfilter = isChecked;
              });
            },
            title: Text('Vegan', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include Vegan meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
        ],),
      ),
    );
  }
}