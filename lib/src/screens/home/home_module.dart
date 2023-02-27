import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/src/screens/dashboard/index.dart';

import 'index.dart';

class HomeModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const Home()),
  ];
  
}