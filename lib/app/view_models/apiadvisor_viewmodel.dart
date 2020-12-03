import 'package:flutter/foundation.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisoir_repository_interface.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisor_model.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  ApiAdvisorViewModel({this.repository});

  fill() async {
    apiAdvisorModel.value = await repository.getClimate();
  }
}
