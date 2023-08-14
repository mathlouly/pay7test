import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityOfBrazilModel {
  String id;
  String nome;
  String estado;

  CityOfBrazilModel({
    required this.id,
    required this.nome,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'estado': estado,
    };
  }

  factory CityOfBrazilModel.fromMap(Map<String, dynamic> map) {
    return CityOfBrazilModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      estado: map['estado'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityOfBrazilModel.fromJson(String source) =>
      CityOfBrazilModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
