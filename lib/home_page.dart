import 'package:flutter/material.dart';

import 'consultar_page.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConsultarPage()));
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
