import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getClimate();
}
