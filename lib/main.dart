import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/repository.dart';
import 'home_page.dart';


void main() async{
  
   ConteudoRepository().initRepo();

  
  
  runApp(TempusApp());
}

class TempusApp extends StatelessWidget {
  const TempusApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
