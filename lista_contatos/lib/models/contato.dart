import 'dart:convert';

class Contato {
  final int id;
  final String nome;
  final String telefone;
  final String email;

  Contato(this.id, this.nome, this.telefone, this.email);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }

  static Contato fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Contato(
      map['id'],
      map['nome'],
      map['telefone'],
      map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  static Contato fromJson(String source) => fromMap(json.decode(source));
}
