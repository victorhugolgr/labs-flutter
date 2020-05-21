import 'package:flutter/material.dart';
import 'package:lista_contato_modular/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/database/init.database.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //permite carregar dados dados assincronos no main()
  await DatabaseHelper.instance.database;

  runApp(ModularApp(module: AppModule()));
}
