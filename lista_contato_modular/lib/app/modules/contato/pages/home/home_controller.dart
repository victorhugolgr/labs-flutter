import 'package:flutter/material.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/edit/contato_edit_page.dart';
import 'package:lista_contato_modular/app/modules/contato/pages/list/contato_page.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentTab = 0; // to keep track of active tab index

  @observable
  Widget currentScreen = ContatoPage();

  final PageStorageBucket bucket = PageStorageBucket();

  @action
  setCurrentTab(Widget screen, int tab) {
    this.currentScreen = screen;
    this.currentTab = tab;
  }
}
