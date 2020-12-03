import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/app/controllers/app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.intance.themeSwitch.value ?? false,
      onChanged: (value) {
        AppController.intance.changeTheme(value);
      },
    );
  }
}
