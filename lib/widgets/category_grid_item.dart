import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:meals_app/models/category.dart';
class CategoryGridItem  extends StatelessWidget{
  const CategoryGridItem({super.key,
  required this.category,
  required this.onselectCategory });

  final Category category;
  final void Function() onselectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectCategory,
      splashColor: const Color.fromARGB(255, 242, 214, 111),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(category.title, 
        style: TextStyle(fontSize: 25),),
      ),
    );
  }
}