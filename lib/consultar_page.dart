import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/repository.dart';

class ConsultarPage extends StatefulWidget {
  const ConsultarPage({super.key});

  @override
  State<ConsultarPage> createState() => _ConsultarPageState();
}

class _ConsultarPageState extends State<ConsultarPage> {
  ConteudoRepository repository = ConteudoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividades'),
      ),
      body: ValueListenableBuilder(
          valueListenable: repository.conteudosBox.listenable(),
          builder: (context, box, widget) {
            for (var chave in box.keys) {
              var conteudo = box.get(chave);
            
              return ListTile(
                leading: Text(conteudo),
              
              );
            }
            
            return Text('Nenhum conteudo encontrado');
          }),
    );
  }
}
