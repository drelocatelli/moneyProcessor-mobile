import 'package:flutter_modular/flutter_modular.dart';
import 'index.dart';

class DashboardModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const DashboardPage())
  ];
  
}