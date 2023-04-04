import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/consts.dart';
import 'package:tempusapp/conteudo.dart';
import 'package:tempusapp/gerenciar_page.dart';
import 'package:tempusapp/repository.dart';

class ConsultarPage extends StatefulWidget {
  const ConsultarPage({super.key});

  @override
  State<ConsultarPage> createState() => _ConsultarPageState();
}

class _ConsultarPageState extends State<ConsultarPage> {
  ConteudoRepository repository = ConteudoRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividades'),
      ),
      body: ValueListenableBuilder<Box>(
          valueListenable: repository.conteudoBox.listenable(),
          builder: (context, box, widget) {
            var listaconteudo = <Widget>[];
            for (var chave in box.keys) {
              final conteudo = box.get(chave);
              final tileWidget = Dismissible(
                key: ValueKey<int>(conteudo["id"]),
                onDismissed: (direction) {
                  repository.deletarConteudo(conteudo["id"]);
                },
                child: ListTile(
                  leading: CircleAvatar(
                      child: Icon(conteudo['tipo'] == AUDIO
                          ? Icons.headphones
                          : Icons.tv)),
                  title: Text(conteudo['descricao']),
                  subtitle: Text(conteudo['tipo']),
                  trailing: Icon(Icons.edit),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GerenciarPage(
                                  conteudo: Conteudo.fromMap(conteudo))));
                    });
                  },
                ),
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
