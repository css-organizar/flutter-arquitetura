import 'package:dio/dio.dart';
import 'package:flutter_arquitetura/infrastructure/interfaces/clienmt_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String baseUrl) async {
    var response = await dio.get(baseUrl);
    return response.data;
  }
}
