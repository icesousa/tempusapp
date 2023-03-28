import 'dart:math';

class Conteudo {
  final int id;
  final String descricao;
  final String tipo;
  final int minutos;
  final double velocidade;
  late int tempo;

  Conteudo(
    this.descricao,
    this.tipo,
    this.minutos,
    this.velocidade,
  ) : id = Random().nextInt(9999999) {
    tempo = (minutos / velocidade).round();
  }

  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'descricao': descricao,
      'tipo': tipo,
      'minutos': minutos,
      'velocidade': velocidade,
      'tempo': tempo,
    };
  }
}
