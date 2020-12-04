import 'package:flutter_arquitetura/infrastructure/interfaces/clienmt_http_interface.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisoir_repository_interface.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_model.dart';

import '../../../application/common/constants/constants.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository({this.client});

  @override
  Future<ApiAdvisorModel> getClimate() async {
    var json = await client.get("$baseUrl?token=$apiToken");
    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
