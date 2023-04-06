import 'package:flutter/material.dart';
import 'package:tempusapp/repository.dart';

class RepositoryInherited extends InheritedWidget{
  final ConteudoRepository repository;


  RepositoryInherited({Key? key, required this.repository, required Widget child}):super(key: key, child: child);
  
@override
  bool updateShouldNotify(RepositoryInherited oldWidget) {
   return repository != oldWidget.repository;
  }

  static RepositoryInherited? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<RepositoryInherited>();
  }

}