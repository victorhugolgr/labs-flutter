import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Telefone'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.phone,
            ),
            TextField(
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
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
