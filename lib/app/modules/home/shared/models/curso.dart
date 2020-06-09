import 'disciplina.dart';

class Curso {
  int id;
  String nome;
  int qtdSesmestres;
  String descricao;
  List<Disciplinas> disciplinas;

  Curso(
      {this.id,
      this.nome,
      this.qtdSesmestres,
      this.descricao,
      this.disciplinas});

  Curso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    qtdSesmestres = json['qtdSesmestres'];
    descricao = json['descricao'];
    if (json['disciplinas'] != null) {
      disciplinas = new List<Disciplinas>();
      json['disciplinas'].forEach((v) {
        disciplinas.add(new Disciplinas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['qtdSesmestres'] = this.qtdSesmestres;
    data['descricao'] = this.descricao;
    if (this.disciplinas != null) {
      data['disciplinas'] = this.disciplinas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
