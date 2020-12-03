import 'package:flutter/foundation.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_model.dart';
import 'package:flutter_arquitetura/infrastructure/view_models/apiadvisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController({this.viewModel});

  ValueNotifier<ApiAdvisorModel> get climate => viewModel.apiAdvisorModel;

  getClimate() {
    viewModel.fill();
  }
}
