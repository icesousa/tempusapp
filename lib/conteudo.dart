import 'dart:math';

class Conteudo{
 int id = Random().nextInt(9999999);
final String descricao;
final String tipo;
final int minutos;
final double velocidade;
late  int tempo;
  

  Conteudo(this.descricao, this.tipo, this.minutos, this.velocidade, ){
    tempo = (minutos/velocidade).round();
  }




  Map<String, dynamic> tomap()   {
    return{
       'id' : id,
    'descricao' : descricao,
    'tipo' : tipo,
    'minutos' : minutos,
    'velocidade': velocidade,
    'tempo' : tempo,

    };

   
  }
}

