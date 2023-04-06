import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/consts.dart';
import 'package:tempusapp/conteudo.dart';
import 'package:tempusapp/gerenciar_page.dart';
import 'package:tempusapp/repository_inherited.dart';

class ConsultarPage extends StatefulWidget {
  const ConsultarPage({super.key});

  @override
  State<ConsultarPage> createState() => _ConsultarPageState();
}

class _ConsultarPageState extends State<ConsultarPage> {
  bool retorno = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context, retorno);
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Atividades'),
      ),
      body: ValueListenableBuilder<Box>(
          valueListenable: RepositoryInherited.of(context)!
              .repository
              .conteudoBox
              .listenable(),
          builder: (context, box, widget) {
            var listaconteudo = <Widget>[];
            for (var chave in box.keys) {
              final conteudo = box.get(chave);
              final tileWidget = Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete, size: 45,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                key: ValueKey<int>(conteudo["id"]),
                onDismissed: (direction) {
                  retorno = true;
                  RepositoryInherited.of(context)!
                      .repository
                      .deletarConteudo(conteudo["id"]);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff9b1b30),
                      child: Icon(conteudo['tipo'] == AUDIO
                          ? Icons.headphones
                          : Icons.tv,color: Colors.white, )) ,
                  title: customTextStl("${conteudo['descricao']}" ),
                  
                  
                  subtitle: Row(
                    children: [
                      Text(conteudo['tipo']),
                      SizedBox(width: 10,),
                      Text("—  ${conteudo['minutos']} minutos")
                    ],
                  ),
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
