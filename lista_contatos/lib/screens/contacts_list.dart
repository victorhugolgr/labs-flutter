import 'package:flutter/material.dart';
import 'package:lista_contatos/database/app_database.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:lista_contatos/screens/contact_form.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: findAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final contato = contatos[index];
                  return _ContatoItem(contato);
                },
                itemCount: contatos.length,
              );
              break;
          }

          return Text('Unknown error!');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contato contato;

  _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contato.nome),
        subtitle: Text(contato.telefone),
      ),
    );
  }
}
