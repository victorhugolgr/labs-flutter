import 'package:flutter/material.dart';
import 'package:lista_contatos/database/app_database.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:lista_contatos/screens/dashboard.dart';

void main() {
  runApp(ListaContatosApp());
  debugPrint('===================================================');
  save(Contato(0, 'Victor', '9132563994', 'victor.hugo@tu.nos')).then((id) {
    findAll().then((contatos) => debugPrint(contatos.toString()));
  });
}

class ListaContatosApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.yellowAccent[700],
      ),
      home: Dashboard(),
    );
  }
}
