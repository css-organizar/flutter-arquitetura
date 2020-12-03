import 'package:flutter/foundation.dart';

// Ingleton

class AppController {
  //

  //Final para deixar o singleton totalmente protegido evitar instância e implementações

  static final AppController intance = AppController._();

  // Contrutor privato, não pode ser utilizado fora do singleton

  AppController._();

  // Gerência de Estados Nativo -> ValueNotifier

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
