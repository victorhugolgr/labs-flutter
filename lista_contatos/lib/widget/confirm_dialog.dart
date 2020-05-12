import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({this.texto, this.sim, this.nao});

  final String texto;
  final Function sim;
  final Function nao;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(texto),
      actions: <Widget>[
        FlatButton(
          child: Text('Não'),
          onPressed: nao,
        ),
        FlatButton(
          child: Text('Sim'),
          onPressed: sim,
        ),
      ],
    );
  }
}
