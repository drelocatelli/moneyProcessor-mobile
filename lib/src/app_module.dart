import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/src/screens/dashboard/dashboard_module.dart';
import 'package:mp_mobile/src/screens/dashboard/index.dart';
import 'package:mp_mobile/src/screens/home/home_module.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/dashboard', module: DashboardModule(), transition: TransitionType.fadeIn),
  ];
  
}