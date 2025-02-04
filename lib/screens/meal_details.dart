
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';


class MealDetails extends StatelessWidget{
  MealDetails({super.key, required this.meal,
  required this.ontoggleFavourite});

  final Meal meal;
  final void Function(Meal meal) ontoggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            ontoggleFavourite(meal);
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView(
        children: [
          Image.network(meal.imageUrl,
          width: double.infinity, height: 300,
          fit: BoxFit.cover,),
          const SizedBox(height: 14,),
          Text("Ingredients", 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          for(final ingredient in meal.ingredients)
          Text(ingredient,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,)),
            SizedBox(height: 20,),

            Text("Steps", 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          for(final step in meal.steps)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8
            ),
            child: Text(step,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)),
          ),
            SizedBox(height: 20,),
        ],
      ),
    );
  }
}