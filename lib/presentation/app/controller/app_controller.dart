import 'package:flutter/foundation.dart';

import 'package:flutter_arquitetura/infrastructure/services/shared_local_storage_service.dart';
import 'package:flutter_arquitetura/infrastructure/view_models/change_theme_viewmodel.dart';

class AppController {
  static final AppController intance = AppController._();

  AppController._() {
    changeTHemeViewModel.init();
  }

  final ChangeThemeViewModel changeTHemeViewModel = ChangeThemeViewModel(
    storage: SharedLocalStorageService(),
  );

  bool get isDark => changeTHemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => changeTHemeViewModel.config.themeSwitch;
}
