class Conteudo {
  final int id;
  final String descricao;
  final String tipo;
  final int minutos;
  final double velocidade;
  late int tempo;

  Conteudo(
    this.id,
    this.descricao,
    this.tipo,
    this.minutos,
    this.velocidade,
  ) {
    tempo = (minutos / velocidade).round();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'tipo': tipo,
      'minutos': minutos,
      'velocidade': velocidade,
      'tempo': tempo,
    };
  }

  static Conteudo fromMap(Map<dynamic, dynamic> map) {
    return Conteudo(map['id'], map['descricao'], map['tipo'], map['minutos'],
        map['velocidade']);
  }
}
