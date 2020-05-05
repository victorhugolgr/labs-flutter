import 'package:flutter/material.dart';
import 'package:lista_contatos/screens/contact_form.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Victor'),
              subtitle: Text('(91) 3256-3004'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
