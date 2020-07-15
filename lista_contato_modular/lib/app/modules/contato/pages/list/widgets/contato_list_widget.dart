import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/widgets/item_widget.dart';
import 'package:mobx/mobx.dart';

class ContatoListWidget extends StatelessWidget {
  final ObservableFuture<List<ContatoModel>> contatos;
  final Function onErro;

  const ContatoListWidget({Key key, this.contatos, this.onErro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (contatos.error != null) {
          return Center(
            child: RaisedButton(
              onPressed: onErro,
              child: Text("Houve um erro"),
            ),
          );
        }

        if (contatos.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: contatos.value.length,
          itemBuilder: (_, index) {
            return ItemWidget(
              model: contatos.value[index],
              onPressed: () => Modular.link
                  .pushNamed('/detail/' + contatos.value[index].id.toString()),
            );
          },
        );
      },
    );
  }
}
