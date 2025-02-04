import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
//import 'package:new_flutter/Page1.dart';

// inoreder to show splash screen for few seconds
// we need to use init function of statefulwidget 
//stateful is used bcos whole page is changing i.e to make it dynamic
//bcos the screen needs to disappear automatically
// which will automnaticalluy change the splash after starting of few seconds

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}
class _SplashScreen extends State<Splash> with SingleTickerProviderStateMixin{

  
  late Animation ani;
  late Animation col ;
  late AnimationController anictrl;


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(   //this push the screen and remove it after timer
                            // removing it wont be achieved by back navigating
        context, MaterialPageRoute(builder: (context) =>Tabs()),);
    });

    
    anictrl = AnimationController(vsync: this,
    duration: Duration(seconds: 3));
    ani = Tween(begin: 0.0,end: 50.0).animate(anictrl); // gives the first and last value
      // controller will reach to the last value in the given duration
      // also shows the in between values too
      col = ColorTween(begin: const Color.fromARGB(255, 228, 189, 132), end: const Color.fromARGB(255, 217, 185, 41)).animate(anictrl);

    anictrl.addListener((){
      print(ani.value);
      setState(() {
        
      });
    });

    anictrl.forward(); // for starting animation
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 97, 43, 3),
                const Color.fromARGB(255, 45, 20, 2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Center(
          child: Text("Meals App", style: TextStyle(
            fontSize: ani.value,
            color: col.value,
            fontWeight: FontWeight.bold,
            
          ),),
        ),
      ),
    );
  }
}