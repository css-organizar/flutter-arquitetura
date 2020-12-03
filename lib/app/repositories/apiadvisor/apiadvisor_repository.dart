import 'package:flutter_arquitetura/app/interfaces/clienmt_http_interface.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisoir_repository_interface.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisor_model.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository({this.client});

  @override
  Future<ApiAdvisorModel> getClimate() async {
    var json = await client.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=c00809ff1f4919fabd7bcceebf611f23");
    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
