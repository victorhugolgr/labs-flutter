import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/list/widgets/contato_list_widget.dart';
import 'package:mobx/mobx.dart';

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
        body: Column(
          children: <Widget>[
            Observer(builder: (_) {
              switch (controller.favorites.status) {
                case FutureStatus.pending:
                  return LinearProgressIndicator();
                  break;
                case FutureStatus.rejected:
                  return Text("Rejected");
                  break;
                case FutureStatus.fulfilled:
                  return Column(
                    children: <Widget>[
                      Text("Favoritos"),
                      Observer(builder: (_) {
                        return Visibility(
                          visible: controller.favorites != null,
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.favorites.value.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () => Modular.link.pushNamed(
                                      '/detail/' +
                                          controller.contatos.value[index].id
                                              .toString()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "images/default_user.png"),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      Divider(),
                    ],
                  );
                  break;
              }
              return Text("Erro!!!");
            }),
            ContatoListWidget(
              contatos: controller.contatos,
              onErro: controller.loadList(),
            )
          ],
        ));
  }
}
