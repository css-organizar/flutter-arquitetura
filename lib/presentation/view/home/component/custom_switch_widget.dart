import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/application/app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.intance.isDark,
      onChanged: (value) {
        AppController.intance.changeTHemeViewModel.changeTheme(value);
      },
    );
  }
}
