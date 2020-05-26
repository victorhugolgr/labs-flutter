import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/contato_detail_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/widgets/bottom_content_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/widgets/button_content_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/widgets/icon_button_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/widgets/info_attr_content_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/detail/widgets/top_content_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/widgets/confirm_dialog_widget.dart';

class ContatoDetailPage extends StatefulWidget {
  final String title;
  final String id;
  const ContatoDetailPage({Key key, this.title = "ContatoDetail", this.id})
      : super(key: key);

  @override
  _ContatoDetailPageState createState() => _ContatoDetailPageState();
}

class _ContatoDetailPageState
    extends ModularState<ContatoDetailPage, ContatoDetailController> {
  @override
  void initState() {
    controller.load(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            TopContentWidget(contato: controller.model),
            ButtonContentWidget(
              contato: controller.model,
              children: <Widget>[
                IconButtonWidget(
                    text: 'Favoritar',
                    icon: Icons.favorite_border,
                    onTap: () {}),
                IconButtonWidget(
                    text: 'Editar',
                    icon: Icons.edit,
                    onTap: () => controller.edit()),
                IconButtonWidget(
                    text: 'Excluir',
                    icon: Icons.delete,
                    onTap: () {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmDialogWidget(
                              texto:
                                  'Deseja excluir o contato ${controller.model.nome}?',
                              sim: () => controller.delete(),
                              nao: () => Navigator.of(context).pop(),
                            );
                          });
                    }),
              ],
            ),
            BottomContentWidget(
              children: <Widget>[
                InfoAttrContentWidget(
                    icon: Icons.phone,
                    text: controller.model.telefone,
                    onTap: () => controller.call()),
                SizedBox(height: 16.0),
                InfoAttrContentWidget(
                    icon: Icons.alternate_email,
                    text: controller.model.email,
                    onTap: () => controller.sendMail())
              ],
            )
          ],
        );
      }),
    );
  }
}
