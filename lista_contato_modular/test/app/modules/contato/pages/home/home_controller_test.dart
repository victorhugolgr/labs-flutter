import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lista_contato_modular/app/modules/contato/pages/home/home_controller.dart';
import 'package:lista_contato_modular/app/modules/contato/contato_module.dart';

void main() {
  initModule(ContatoModule());
  // HomeController home;
  //
  setUp(() {
    //     home = ContatoModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    //   test("First Test", () {
    //     expect(home, isInstanceOf<HomeController>());
    //   });

    //   test("Set Value", () {
    //     expect(home.value, equals(0));
    //     home.increment();
    //     expect(home.value, equals(1));
    //   });
  });
}
