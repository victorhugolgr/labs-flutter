import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/edit/contato_edit_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/widgets/text_field_widget.dart';

class ContatoEditPage extends StatefulWidget {
  final String title;
  final String id;
  const ContatoEditPage({Key key, this.title = "Novo contato", this.id})
      : super(key: key);

  @override
  _ContatoEditPageState createState() => _ContatoEditPageState();
}

class _ContatoEditPageState
    extends ModularState<ContatoEditPage, ContatoEditController> {
  @override
  void initState() {
    if (widget.id != null) controller.load(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.key,
            autovalidate: controller.validate,
            child: Column(
              children: <Widget>[
                TextFieldWidget(
                  labelText: 'Nome',
                  controller: controller.nomeController,
                  validator: controller.validarNome,
                  icon: Icons.person,
                ),
                SizedBox(height: 16.0),
                TextFieldWidget(
                  labelText: 'Telefone',
                  controller: controller.telefoneController,
                  validator: controller.validarCelular,
                  textInputType: TextInputType.phone,
                  icon: Icons.phone,
                ),
                SizedBox(height: 16.0),
                TextFieldWidget(
                    labelText: 'E-mail',
                    validator: controller.validateEmail,
                    controller: controller.emailController,
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.alternate_email),
                SizedBox(height: 16.0),
                RaisedButton(
                  onPressed: () => controller.salvar(),
                  child: Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
