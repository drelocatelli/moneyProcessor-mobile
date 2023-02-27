import 'package:flutter_modular/flutter_modular.dart';

import 'index.dart';

class HomeModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const Home())
  ];
  
}