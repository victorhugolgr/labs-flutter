import 'package:flutter/material.dart';

import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';

class ButtonContentWidget extends StatelessWidget {
  final ContatoModel contato;
  final List<Widget> children;

  const ButtonContentWidget({
    Key key,
    this.contato,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
        Divider(),
      ],
    );
  }
}
