import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'atividades_page.dart';
import 'gerenciar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempus'),
      ),
      body: Column(
        children: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AtividadesPage()));
              },
              icon: Icon(Icons.search),
              label: Text('Consultar')),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GerenciarPage()));

              },
              icon: Icon(Icons.add),
              label: Text('Adicionar')),
        ],
      ),
    );
  }
}
