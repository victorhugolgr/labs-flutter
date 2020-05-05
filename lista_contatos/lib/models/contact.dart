class Contact {
  final String nome;
  final String telefone;
  final String email;

  Contact(this.nome, this.telefone, this.email);



  @override
  String toString() => 'Contact(nome: $nome, telefone: $telefone, email: $email)';
}
