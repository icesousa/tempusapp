import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tempusapp/consts.dart';
import 'package:tempusapp/conteudo.dart';
import 'repository.dart';
import 'repository_inherited.dart';

class GerenciarPage extends StatefulWidget {
  const GerenciarPage({super.key, this.conteudo});
  final Conteudo? conteudo;

  @override
  State<GerenciarPage> createState() => _GerenciarPageState();
}

class _GerenciarPageState extends State<GerenciarPage> {
  void _saveConteudo() {
    var idConteudo = widget.conteudo?.id ?? Random().nextInt(999999);
    var ecoTempo = (_minutes / _velocidadelist[_indexvelocidade!]).round();

    var conteudo = Conteudo(
      idConteudo,
      _descricaocontroller.text,
      _tipo!,
      _minutes.round(),
      _velocidadelist[_indexvelocidade!],
      ecoTempo,
    );

    setState(() {
      RepositoryInherited.of(context)!.repository.adicionarConteudo(conteudo);
      Navigator.pop(context, true);
    });
  }

  String? _tipo = audio;
  int? _indexvelocidade = 1;
  double _minutes = 20;

  final List<double> _velocidadelist = [
    1.25,
    1.50,
    1.75,
    2.0,
  ];
  final TextEditingController _descricaocontroller = TextEditingController();
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
          title: const Text('Gerenciar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextStl('Tipo de Conteudo'),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        items: const [
                          DropdownMenuItem(value: audio, child: Text(audio)),
                          DropdownMenuItem(value: video, child: Text(video)),
                        ],
                        value: _tipo,
                        onChanged: (novovalor) {
                          setState(() {
                            _tipo = novovalor;
                          });
                        }),
                  ),
                ],
              ),
              const Divider(),
              customTextStl('Velocidade'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List<Widget>.generate(_velocidadelist.length, (index) {
                  return ChoiceChip(
                    selectedColor: const Color(0xff9b1b30),
                    label: Text(
                        _velocidadelist.elementAt(index).toStringAsFixed(2)),
                    selected: _indexvelocidade == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _indexvelocidade = selected ? index : null;
                      });
                    },
                  );
                }),
              ),
              const Divider(),
              customTextStl('Minutos '),
              Row(
                children: [
                  SizedBox(
                      width: 30, child: customTextStl('${_minutes.round()} ')),
                  Expanded(
                    child: Slider(
                        min: 1,
                        max: 240,
                        value: _minutes,
                        onChanged: (novominuto) {
                          setState(() {
                            _minutes = novominuto;
                          });
                        }),
                  ),
                ],
              ),
              const Divider(),
              customTextStl('O que assistiu / ouviu?'),
              const SizedBox(height: 10),
              TextField(
                controller: _descricaocontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                  onHover: (value) {},
                  onPressed: _saveConteudo,
                  icon: const Icon(Icons.check),
                  label: const Text('Salvar'))
            ],
          ),
        ));
  }
}
