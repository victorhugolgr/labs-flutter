import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/favorite/favorite_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/list/widgets/contato_list_widget.dart';

class FavoritePage extends StatefulWidget {
  final String title;
  const FavoritePage({Key key, this.title = "Favorite"}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState
    extends ModularState<FavoritePage, FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return (controller.contatos != null &&
            controller.contatos.error == null &&
            controller.contatos.value != null &&
            controller.contatos.value.length == 0)
        ? Image(image: AssetImage("images/favorites_empty"))
        : ContatoListWidget(
            contatos: controller.contatos,
            onErro: controller.loadList(),
          );
  }
}
