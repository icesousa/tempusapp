import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tempusapp/consts.dart';
import 'package:tempusapp/conteudo.dart';
import 'repository.dart';

class GerenciarPage extends StatefulWidget {
  GerenciarPage({super.key, this.conteudo});
  final Conteudo? conteudo;

  @override
  State<GerenciarPage> createState() => _GerenciarPageState();
}

class _GerenciarPageState extends State<GerenciarPage> {
  void _saveConteudo() {
    var idConteudo = widget.conteudo?.id ?? Random().nextInt(999999);

    var conteudo = Conteudo(
      idConteudo,
      _descricaocontroller.text,
      _tipo!,
      _minutes.round(),
      _velocidadelist[_indexvelocidade!],
    );

    setState(() {
      repository.adicionarConteudo(conteudo);
      Navigator.pop(context);
    });
  }

  String? _tipo = AUDIO;
  int? _indexvelocidade = 1;
  double _minutes = 20;

  List<double> _velocidadelist = [
    1.25,
    1.50,
    1.75,
    2.0,
  ];
  TextEditingController _descricaocontroller = TextEditingController();
  ConteudoRepository repository = ConteudoRepository();

  @override
  void initState() {
    super.initState();
    if (widget.conteudo != null) {
      _tipo = widget.conteudo!.tipo;
      _indexvelocidade = _velocidadelist.indexOf(widget.conteudo!.velocidade);
      _descricaocontroller.text = widget.conteudo!.descricao;
      _minutes = widget.conteudo!.minutos.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              customTextStl('Tipo de Conteudo'),
              DropdownButton<String>(
                  items: [
                    DropdownMenuItem(child: Text(AUDIO), value: AUDIO),
                    DropdownMenuItem(child: Text(VIDEO), value: VIDEO),
                  ],
                  value: _tipo,
                  onChanged: (novovalor) {
                    setState(() {
                      _tipo = novovalor;
                    });
                  }),
              customTextStl('Velocidade'),
              Wrap(
                children:
                    List<Widget>.generate(_velocidadelist.length, (index) {
                  return ChoiceChip(
                    label: Text(_velocidadelist.elementAt(index).toString()),
                    selected: _indexvelocidade == index,
                    
                    onSelected: (bool selected) {
                      setState(() {
                        _indexvelocidade = selected ? index : null;
                      });
                    },
                  );
                }),
              ),
              Text('Minutos   ${_minutes.round()}'),
              Slider(
                  min: 1,
                  max: 240,
                  value: _minutes,
                  onChanged: (novominuto) {
                    setState(() {
                      _minutes = novominuto;
                    });
                  }),
              Text('Descrição'),
              TextField(
                controller: _descricaocontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    _saveConteudo();
                  },
                  icon: Icon(Icons.check),
                  label: Text('Salvar'))
            ],
          ),
        ));
  }
}
