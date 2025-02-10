import 'package:flutter/material.dart';
//import 'package:meals_app/data/dummy_data.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0)),
        useMaterial3: true,
        //textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: Splash()// MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  

//   // @override
//   // Widget build(BuildContext context) {
    
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       // TRY THIS: Try changing the color here to a specific color (to
//   //       // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//   //       // change color while the other colors stay the same.
//   //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//   //       // Here we take the value from the MyHomePage object that was created by
//   //       // the App.build method, and use it to set our appbar title.
//   //       title: Text(widget.title),
//   //     ),
//   //     body: 
      
//   //   );
//   // }
// }



//GIT DEMO
//GIT DEMO BRANCH 1
//GIT PULL DEMO B1
