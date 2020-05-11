import 'package:flutter/material.dart';
import 'package:lista_contatos/screens/contato_detail.dart';
import 'package:lista_contatos/screens/contato_form.dart';
import 'package:lista_contatos/screens/contato_list.dart';
import 'package:lista_contatos/screens/dashboard.dart';

void main() => runApp(ListaContatosApp());

class ListaContatosApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/list': (context) => ContatoList(),
        '/edit': (context) => ContatoForm(),
        '/detail': (context) => ContatoDetail(),
      },
      theme: ThemeData(
        accentColor: Colors.yellowAccent[700],
      ),
    );
  }
}
