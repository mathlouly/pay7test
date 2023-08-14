import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StateOfBrazilModel {
  String id;
  String sigla;
  String nome;

  StateOfBrazilModel({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory StateOfBrazilModel.fromMap(Map<String, dynamic> map) {
    return StateOfBrazilModel(
      id: map['id'] as String,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateOfBrazilModel.fromJson(String source) =>
      StateOfBrazilModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
