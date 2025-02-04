import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';


const kInitialFilter={
  Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _selectedPageIndex = 0;
  var activePageTitle = "Categories";
  final List<Meal> _favouriteMeals = [];

  Map<Filter,bool> selectedFilters = kInitialFilter;

  void _showInfoMessage (String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),),
    );

  }
  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        
      });
      _favouriteMeals.remove(meal);
      _showInfoMessage("Meal is no longer a favourite");

    }else{
      setState(() {
        
      });
      _favouriteMeals.add(meal);
      _showInfoMessage("Meal marked as favourite");
    }
  }

  void _selectPage(int index){
    setState(() {
      
    });
    _selectedPageIndex = index;
  }

  void _setScreen(String identifier )async{
    Navigator.pop(context);  // manuallyy closing the drawer, bcos
      // by default we are on teh same screen when we open it
    if(identifier=='filters'){
      
      final result = await Navigator.push<Map<Filter, bool>>(context, 
      MaterialPageRoute(builder: (context)=>Filters(currentFilters: selectedFilters,)));
      setState(() {
        
      });
      selectedFilters = result ?? kInitialFilter;
    }
  }
  @override
  Widget build(BuildContext context) {

    final availableMeal = dummyMeals.where((meal){
      if(selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree)
      {return false;
      }
      if(selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree)
      {return false;
      }
      if(selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)
      {return false;
      }
      if(selectedFilters[Filter.vegan]! && !meal.isVegan)
      {return false;
      }
      return true;
    }).toList();


    Widget activePage =  Categories(
      ontoggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeal,);
    if(_selectedPageIndex == 1){
      activePage = MealsScreen(title: 'Favourites', 
      meals: _favouriteMeals, 
      ontoggleFavourite: _toggleMealFavouriteStatus,);
      activePageTitle = "MEALS APP";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label:"Categories" ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label:"Favourites" ),
        ],
      ),
    );
  }
}