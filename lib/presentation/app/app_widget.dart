import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/connection/sqlite_floor_connection.dart';
import 'package:flutter_arquitetura/infrastructure/modules/app_module.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_repository.dart';
import 'package:flutter_arquitetura/infrastructure/services/client_http_service.dart';
import 'package:flutter_arquitetura/infrastructure/view_models/apiadvisor_viewmodel.dart';
import 'package:flutter_arquitetura/presentation/app/controller/app_controller.dart';
import 'package:flutter_arquitetura/presentation/view/home/controller/home_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:moduler_route/moduler_route.dart';

class AppWidget extends StatelessWidget with Moduler {
  final SqliteFloorConnection database;

  AppWidget({Key key, this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.intance.themeSwitch,
      builder: (context, value, widget) {
        return MaterialApp(
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [const Locale('pt', 'BR')],
          navigatorKey: Get.key,
          title: 'Exemplo Arquitetura',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: value ? Brightness.dark : Brightness.light,
          ),
          initialRoute: initialRoute(
            () {
              return AppModule.routePaths.homeView;
            },
          ),
          onGenerateRoute: routeTo,
          onUnknownRoute: unknownRoute,
          navigatorObservers: [
            modulerRouteObserver,
          ],
        );
      },
    );
  }

  @override
  List<Injector> get globalInjections => [
        Injector<Dio>(
          inject: (i) {
            Dio dio = Dio(
              BaseOptions(
                connectTimeout: 30000,
                contentType: 'application/json',
              ),
            );
            return dio;
          },
        ),
        Injector<SqliteFloorConnection>(
          inject: (i) => database,
        ),
        Injector<HomeController>(
          inject: (i) => HomeController(
            viewModel: ApiAdvisorViewModel(
              repository: ApiAdvisorRepository(
                client: ClientHttpService(),
              ),
            ),
          ),
        )
      ];

  @override
  List<Module> get modules => [
        AppModule(),
      ];
}
