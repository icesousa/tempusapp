import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/repository.dart';

class ConsultarPage extends StatefulWidget {
  const ConsultarPage({super.key});

  @override
  State<ConsultarPage> createState() => _ConsultarPageState();
}

class _ConsultarPageState extends State<ConsultarPage> {






  @override
  Widget build(BuildContext context) {
  ConteudoRepository repository = ConteudoRepository();



    return Scaffold(
      appBar: AppBar(
        title: Text('Atividades'),
      ),
      body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('conteudo').listenable(),
          builder: (context, box, widget) {
            var listaconteudo = <Widget>[];
            for (var chave in box.keys) {
              final conteudo = box.get(chave);
              
print(conteudo.toString());


              final textWidget = Text(conteudo['id'].toString());
              listaconteudo.add(textWidget);
              print(box.get(chave));
            
              
              
              
            }
            return ListView(
                children: listaconteudo,
              ); 
            
          }),
    );
  }
}
