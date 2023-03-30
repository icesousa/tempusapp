
import 'package:flutter/material.dart';
import 'package:tempusapp/conteudo.dart';
import 'repository.dart';

class GerenciarPage extends StatefulWidget {
   GerenciarPage({super.key, this.conteudo});
  Conteudo? conteudo;

  @override
  State<GerenciarPage> createState() => _GerenciarPageState();
}

class _GerenciarPageState extends State<GerenciarPage> {
  String? _tipo = 'Audio';
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciar'),
        ),
        body: ListView(
          children: [
            Text('Tipo de Conteudo'),
            DropdownButton<String>(
                items: [
                  DropdownMenuItem(child: Text('Audio'), value: 'Audio'),
                  DropdownMenuItem(child: Text('Video'), value: 'Video'),
                ],
                value: _tipo,
                onChanged: (novovalor) {
                  setState(() {
                    _tipo = novovalor;
                  });
                }),
            Text('Velocidade'),
            Wrap(
              children: List<Widget>.generate(_velocidadelist.length, (index) {
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
                  var conteudo = Conteudo(
                    _descricaocontroller.text,
                    _tipo!,
                    _minutes.round(),
                    _velocidadelist[_indexvelocidade!],
                  );
                  setState(() {
                   repository.adicionarConteudo(conteudo);

                  });
                },
                icon: Icon(Icons.check),
                label: Text('Salvar'))
          ],
        ));
  }
}
