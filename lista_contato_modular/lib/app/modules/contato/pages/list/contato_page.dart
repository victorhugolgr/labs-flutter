import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/list/widgets/contato_list_widget.dart';

import 'contato_controller.dart';

class ContatoPage extends StatefulWidget {
  final String title;
  const ContatoPage({Key key, this.title = "Contato"}) : super(key: key);

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends ModularState<ContatoPage, ContatoController> {
  @override
  Widget build(BuildContext context) {
    return ContatoListWidget(
          contatos: controller.contatos,
          onErro: controller.loadList(),
        );
  }
}
