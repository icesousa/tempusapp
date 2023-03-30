import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/gerenciar_page.dart';

class ConsultarPage extends StatefulWidget {
  const ConsultarPage({super.key});

  @override
  State<ConsultarPage> createState() => _ConsultarPageState();
}

class _ConsultarPageState extends State<ConsultarPage> {
  @override
  Widget build(BuildContext context) {
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

              final tileWidget = ListTile(
                leading: CircleAvatar(
                    child: Icon(conteudo['tipo'] == 'Audio'
                        ? Icons.headphones
                        : Icons.tv)),
                title: Text(conteudo['descricao']),
                subtitle: Text(conteudo['tipo']),
                trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GerenciarPage(conteudo: conteudo.toMap)));
                },
              );
              listaconteudo.add(tileWidget);
            }
            return ListView(
              children: listaconteudo,
            );
          }),
    );
  }
}
