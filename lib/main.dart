import 'package:flutter/material.dart';
import 'package:tempusapp/consts.dart';
import 'package:tempusapp/repository.dart';
import 'home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ConteudoRepository.instance.initRepo();
  
  
  runApp(TempusApp());
}

class TempusApp extends StatelessWidget {
  const TempusApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customThemeData(),
      home: HomePage(),
    );
  }
}
