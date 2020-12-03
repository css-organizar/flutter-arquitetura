import 'package:flutter/foundation.dart';
import 'package:flutter_arquitetura/app/interfaces/local_storage_interface.dart';
import 'package:flutter_arquitetura/app/models/app_config_model.dart';
import 'package:flutter_arquitetura/app/services/shared_local_storage_service.dart';

// Ingleton

class AppController {
  //

  //Final para deixar o singleton totalmente protegido evitar instância e implementações

  static final AppController intance = AppController._();

  // Contrutor privato, não pode ser utilizado fora do singleton

  AppController._() {
    storage.get('isDark').then((value) {
      config.themeSwitch.value = value ?? false;
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();

  changeTheme(bool value) {
    themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
