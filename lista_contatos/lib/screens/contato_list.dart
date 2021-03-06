import 'package:flutter/material.dart';
import 'package:lista_contatos/dao/contato_dao.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:lista_contatos/widget/loading.dart';

class ContatoList extends StatefulWidget {
  @override
  _ContatoListState createState() => _ContatoListState();
}

class _ContatoListState extends State<ContatoList> {
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Loading();
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
          Navigator.pushNamed(context, '/edit');
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
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(contato.nome),
          subtitle: Text(contato.telefone),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/batman_profile.png"),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(context, '/detail',
          arguments: <String, int>{'id': contato.id}),
    );
  }
}
