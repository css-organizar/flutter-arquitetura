import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/app/controllers/app_controller.dart';
import 'package:flutter_arquitetura/app/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.intance.themeSwitch,
      builder: (context, value, widget) {
        return MaterialApp(
          title: 'Exemplo Arquitetura',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: value ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
