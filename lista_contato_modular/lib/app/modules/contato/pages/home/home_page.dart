import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/edit/contato_edit_page.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/home/home_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/home/widgets/materia_button_tab_home_widget.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/list/contato_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return PageStorage(
          child: controller.currentScreen,
          bucket: controller.bucket,
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.link.pushNamed('/edit');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Observer(builder: (_) {
                    return MaterialButtonTabHomeWidget(
                      currentTab: controller.currentTab,
                      title: "Contatos",
                      icon: Icons.list,
                      onPressed: () =>
                          controller.setCurrentTab(ContatoPage(), 0),
                      indexTab: 0,
                    );
                  }),
                  Observer(builder: (_) {
                    return MaterialButtonTabHomeWidget(
                      currentTab: controller.currentTab,
                      title: "Favoritos",
                      icon: Icons.favorite,
                      onPressed: () =>
                          controller.setCurrentTab(ContatoPage(), 1),
                      indexTab: 1,
                    );
                  }),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Observer(builder: (_) {
                    return MaterialButtonTabHomeWidget(
                      currentTab: controller.currentTab,
                      title: "Pesquisa",
                      icon: Icons.search,
                      onPressed: () =>
                          controller.setCurrentTab(ContatoPage(), 2),
                      indexTab: 2,
                    );
                  }),
                  Observer(builder: (_) {
                    return MaterialButtonTabHomeWidget(
                      currentTab: controller.currentTab,
                      title: "Mapa",
                      icon: Icons.place,
                      onPressed: () =>
                          controller.setCurrentTab(ContatoEditPage(), 3),
                      indexTab: 3,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
