import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orange[700],
          accentColor: Colors.orangeAccent[100],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.orangeAccent[100],
              textTheme: ButtonTextTheme.primary),
        ),
        home: ListaTransferencia());
  }
}
