import 'package:hive_flutter/hive_flutter.dart';
import 'conteudo.dart';

class ConteudoRepository {
  late Box _conteudoBox;

  // Singleton
  static final ConteudoRepository _instance = ConteudoRepository._internal();
  factory ConteudoRepository() => _instance;
  ConteudoRepository._internal();
  static ConteudoRepository get instance => _instance;


Future<void> initRepo() async {
    await Hive.initFlutter();
    _conteudoBox = await abrirCaixa();
  }

  Box get conteudoBox => _conteudoBox;

  Future<Box> abrirCaixa() async {
    return await Hive.openBox('conteudo');
  }

  Future<void> adicionarConteudo(Conteudo conteudo) async {
    var box = await Hive.openBox('conteudo');
    await box.put(conteudo.id, conteudo.toMap());
  }

Future<void> deletarConteudo(int id) async{
  var box = await Hive.openBox('conteudo');
  await box.delete(id);

}


}