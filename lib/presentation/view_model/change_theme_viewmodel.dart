import 'package:flutter_arquitetura/infrastructure/interfaces/local_storage_interface.dart';
import 'package:flutter_arquitetura/infrastructure/models/app_config_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;
  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({
    this.storage,
  });

  Future init() async {
    await storage.get('isDark').then(
      (value) {
        config.themeSwitch.value = value ?? false;
      },
    );
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
