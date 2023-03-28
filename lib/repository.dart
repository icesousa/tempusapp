import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'conteudo.dart';
class ConteudoRepository {

     late Box _conteudosBox;

ConteudoRepository(){
initRepo();
}


void initRepo() async{
await Hive.initFlutter();
_conteudosBox = await abrirCaixa();

}



  Box get conteudosBox => _conteudosBox;

  Future<Box> abrirCaixa() async {
    
    return await Hive.openBox('conteudos');
  }

  Future<void> adicionarConteudo(Conteudo conteudo) async {
    var box = await abrirCaixa();
    await box.put(conteudo.id, conteudo.tomap());
    print(box.get(conteudo.id));
  }
}
