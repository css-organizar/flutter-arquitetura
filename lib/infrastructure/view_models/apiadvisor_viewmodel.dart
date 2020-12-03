import 'package:flutter/foundation.dart';
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/connection/sqlite_floor_connection.dart';
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/entity/climate_entity.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisoir_repository_interface.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_model.dart';
import 'package:moduler_route/moduler_route.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  ApiAdvisorViewModel({this.repository});

  fill() async {
    apiAdvisorModel.value = await repository.getClimate();
    var entityInstance = ClimateEntity(
      country: apiAdvisorModel.value.country,
      date: apiAdvisorModel.value.date,
      text: apiAdvisorModel.value.text,
    );
    Inject.get<SqliteFloorConnection>().climateDao.insertData(entityInstance);
  }
}
