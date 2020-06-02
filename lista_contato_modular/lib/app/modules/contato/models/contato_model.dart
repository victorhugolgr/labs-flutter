import 'dart:convert';

class ContatoModel {
  final int id;
  String nome;
  String telefone;
  String email;
  String imagemPath;
  bool favorite;

  ContatoModel(
      {this.id,
      this.nome,
      this.telefone,
      this.email,
      this.imagemPath,
      this.favorite = false});

  copyWith({String nome, String telefone, String email, String imagemPath, bool favorite}){
    return ContatoModel(
      id: this.id,
      nome: nome ?? this.nome, 
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      imagemPath: imagemPath ?? this.imagemPath,
      favorite: favorite ?? this.favorite
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'imagemPath': imagemPath,
      'favorite': favorite
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
        favorite: map['favorite'] == 1);
  }

  String toJson() => json.encode(toMap());

  static ContatoModel fromJson(String source) => fromMap(json.decode(source));
}
