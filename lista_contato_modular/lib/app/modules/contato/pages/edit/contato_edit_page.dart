import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/edit/contato_edit_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/widgets/text_field_widget.dart';

class ContatoEditPage extends StatefulWidget {
  final String title;
  const ContatoEditPage({Key key, this.title = "Novo contato"})
      : super(key: key);

  @override
  _ContatoEditPageState createState() => _ContatoEditPageState();
}

class _ContatoEditPageState
    extends ModularState<ContatoEditPage, ContatoEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFieldWidget(
              labelText: 'Nome',
              onChanged: controller.modelView.setNome,
              icon: Icons.person,
            ),
            SizedBox(height: 16.0),
            TextFieldWidget(
              labelText: 'Telefone',
              onChanged: controller.modelView.setTelefone,
              icon: Icons.phone,
            ),
            SizedBox(height: 16.0),
            TextFieldWidget(
                labelText: 'E-mail',
                onChanged: controller.modelView.setEmail,
                icon: Icons.alternate_email),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: ()=> controller.salvar(),
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}