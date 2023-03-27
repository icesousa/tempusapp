import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tempusapp/conteudo.dart';

class ConteudoRepository {
    static late Box _conteudosBox;




ConteudoRepository(){
initRepository();
}


 initRepository()  {
    OpenBoxe();      
    
  }

OpenBoxe() async{
  _conteudosBox = await Hive.openBox('conteudos');
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
