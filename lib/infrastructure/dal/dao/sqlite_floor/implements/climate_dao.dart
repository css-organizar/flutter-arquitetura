import 'package:floor/floor.dart';
import 'package:flutter_arquitetura/infrastructure/dal/dao/sqlite_floor/interfaces/sqlite_dao_interface.dart';
import 'package:flutter_arquitetura/infrastructure/dal/entity/climate_entity.dart';

@dao
abstract class ClimateDao extends ISqliteDao<ClimateEntity> {
  @Query('select * from climate')
  Future<List<ClimateEntity>> findAll();

  @Query('select * from climate')
  Stream<List<ClimateEntity>> findAllStream();

  @Query('DELETE FROM climate')
  Future<void> deleteAllClimates();
}
