import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getClimate();
}
