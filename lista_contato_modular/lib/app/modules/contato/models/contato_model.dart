import 'dart:convert';

class ContatoModel {
  final int id;
  final String nome;
  final String telefone;
  final String email;
  final String imagemPath;

  ContatoModel({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.imagemPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'imagemPath': imagemPath,
    };
  }

  static ContatoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ContatoModel(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      imagemPath: map['imagemPath'],
    );
  }

  String toJson() => json.encode(toMap());

  static ContatoModel fromJson(String source) => fromMap(json.decode(source));
}
