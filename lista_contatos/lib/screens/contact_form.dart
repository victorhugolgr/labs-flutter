import 'package:flutter/material.dart';
import 'package:lista_contatos/models/contato.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nomeController = TextEditingController();
    final TextEditingController _telefoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Criar'),
                  onPressed: () {
                    final String name = _nomeController.text;
                    final String telefone = _telefoneController.text;
                    final String email = _emailController.text;

                    final novoContato = Contato(1, name, telefone, email);
                    Navigator.pop(context, novoContato);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
