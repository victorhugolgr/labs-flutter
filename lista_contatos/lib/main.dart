import 'package:flutter/material.dart';

void main() => runApp(ListaContatosApp());

class ListaContatosApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
    ));
  }
}
