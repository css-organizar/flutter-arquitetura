import 'package:flutter/foundation.dart';
import 'package:flutter_arquitetura/app/models/app_config_model.dart';

// Ingleton

class AppController {
  //

  //Final para deixar o singleton totalmente protegido evitar instância e implementações

  static final AppController intance = AppController._();

  // Contrutor privato, não pode ser utilizado fora do singleton

  AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
