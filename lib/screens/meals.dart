import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({
    super.key,
    required this.title, required this.meals, required this.ontoggleFavourite});


  final String title;
  final List<Meal> meals;
    final void Function(Meal meal) ontoggleFavourite;

  void selectMeal(BuildContext context , Meal meal){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context)=>MealDetails(meal: meal,
      ontoggleFavourite: ontoggleFavourite,)));
  }

  @override
  Widget build(BuildContext context) {

    if(meals.isEmpty){
      Text("Something wnet wrong");
    }

    // if(title == null){
    //   return body
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context,index)=>
      MealItem(meal: meals[index], 
      onSelectMeal: (context, meal) {
        selectMeal(context, meal);
      },
       )),
    );
  }
}