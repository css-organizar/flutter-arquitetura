import 'package:flutter_arquitetura/presentation/view/detalhe_previsao/detalhe_previsao_view.dart';
import 'package:flutter_arquitetura/presentation/view/home/controller/home_controller.dart';
import 'package:flutter_arquitetura/presentation/view/home/home_view.dart';
import 'package:moduler_route/moduler_route.dart';

final String _modulePath = "app-module";

class AppModule extends Module {
  static final routePaths = _Routes();

  @override
  String get path => _modulePath;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths._homeView,
          builder: (args) {
            return HomeView();
          },
          transitionType: RouteTransitionType.fade,
        ),
        ModuleRoute(
          path: routePaths._detalhePrevisaoView,
          builder: (args) {
            return DetalhePrevisaoView(
              detalhe: args,
            );
          },
          transitionType: RouteTransitionType.fade,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<HomeController>(
          inject: (i) => HomeController(),
        ),
      ];
}

class _Routes {
  String _homeView = "home-view";
  String get homeView => "$_modulePath/$_homeView";
  String _detalhePrevisaoView = "detalhe-previsaoView";
  String get detalhePrevisaoView => "$_modulePath/$_detalhePrevisaoView";
}
