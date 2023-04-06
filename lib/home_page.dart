import 'package:flutter/material.dart';
import 'package:tempusapp/repository_inherited.dart';

import 'consultar_page.dart';
import 'gerenciar_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.themeMode, required this.onThemeChanged});
  ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int economizou = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    atualizarTempoEconomizado();
  }

  Future<void> atualizarTempoEconomizado() async {
    final repo = RepositoryInherited.of(context)!.repository;
    final tempoEconomizado = await repo.calcularTempoEconomizado();

    setState(() {
      economizou = tempoEconomizado;
    });
  }

  void _toggleTheme() {
    final newThemeMode =
        widget.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    widget.onThemeChanged(newThemeMode);
  }

  var retorno = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempus'),
        actions: [IconButton(onPressed: _toggleTheme, icon: Icon(Icons.light))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Center(
                child: Container(
              child: Column(
                children: [
                  Text(
                    economizou.toString(),
                    style: TextStyle(
                        fontSize: 200,
                        fontWeight: FontWeight.w300,
                        ),
                  ),
                  Text(
                    'Minutos Economizados',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,),
                  ),
                ],
              ),
            )),
            Spacer(),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsultarPage()))
                      .then((retorno) {
                    if (retorno != null && retorno == true) {
                      atualizarTempoEconomizado();
                      print('testado');
                    }
                  });
                },
                icon: Icon(Icons.search),
                label: Text('Consultar')),
                SizedBox(height: 10,),
            ElevatedButton.icon(
                onPressed: () {
                  print(economizou);
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GerenciarPage()))
                      .then((retorno) {
                    if (retorno != null && retorno) {
                      atualizarTempoEconomizado();
                    }
                  });
                },
                icon: Icon(Icons.add),
                label: Text('Adicionar')),
          ],
        ),
      ),
    );
  }
}
