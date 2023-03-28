import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'conteudo.dart';

class ConteudoRepository {
  late Box _conteudoBox;

  ConteudoRepository() {
    initRepo();
  }

  void initRepo() async {
    await Hive.initFlutter();
    _conteudoBox = await abrirCaixa();
  }

  Box get conteudoBox => _conteudoBox;

  Future<Box> abrirCaixa() async {
    return await Hive.openBox('conteudo');
  }

  Future<void> adicionarConteudo(Conteudo conteudo) async {
    var box = await Hive.openBox('conteudo');
    await box.put(conteudo.id, conteudo.tomap());
    print(box.get(conteudo.id));
  }
}
