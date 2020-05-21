import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';

class ItemWidget extends StatelessWidget {
  final ContatoModel model;
  final Function onPressed;

  const ItemWidget({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          return ListTile(
            onTap: onPressed,
            title: Text(model.nome),
            subtitle: Text(model.email),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CircleAvatar(backgroundImage: AssetImage("images/batman_profile.png"),),
            ),
          );
        },
      ),
    );
  }
}
