import 'package:hive_flutter/hive_flutter.dart';
import 'conteudo.dart';

class ConteudoRepository {
  late Box _conteudoBox;


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


  Future<int> calcularTempoEconomizado() async {
    int totalTempoEconomizado = 0;
    for (int i = 0; i < _conteudoBox.length; i++) {
      final conteudo = Conteudo.fromMap(_conteudoBox.getAt(i));
      totalTempoEconomizado += conteudo.tempo;
    }
    return totalTempoEconomizado;
  }


}