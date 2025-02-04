

import 'package:flutter/material.dart';

class MainDrawer  extends StatelessWidget{

  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  const Color.fromARGB(255, 181, 66, 9),
                ],
                begin: Alignment(0.0, 1.0),
                end: Alignment(1.0, 0.0),
              ),
            ),
            child:Row(children: [
              Icon(Icons.fastfood , size: 48,color: Theme.of(context).colorScheme.primary,),
              SizedBox(width: 18,),
              Text('Cooking Up!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary 
              ), ),
            ],) ,
          ),

          ListTile(
            leading: Icon(Icons.restaurant, size: 26, color: const Color.fromARGB(255, 181, 66, 9),),
            title: Text('Meals', 
            style:Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground , fontSize: 25) ,),

           onTap: (){
            onSelectScreen('emals');
           },     

          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26, color: const Color.fromARGB(255, 181, 66, 9),),
            title: Text('Filters', 
            style:Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground , fontSize: 25) ,),

           onTap: (){
            onSelectScreen('filters');
           },     

          ),
        ],
      )
    );
  }
}