import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/widgets/item_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.link.pushNamed('/edit');
        },
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.contatos.length,
          itemBuilder: (_, index) {
            return ItemWidget(
              model: controller.contatos[index],
              onPressed: ()=>Modular.link.pushNamed('/detail/' + controller.contatos[index].id.toString()),
            );
          },
        );
      }),
    );
  }
}
