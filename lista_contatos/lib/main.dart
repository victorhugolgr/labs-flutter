import 'package:flutter/material.dart';
import 'package:lista_contatos/screens/dashboard.dart';

void main() => runApp(ListaContatosApp());

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
