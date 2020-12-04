import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_arquitetura/infrastructure/dal/dao/sqlite_floor/implements/climate_dao.dart';
import 'package:flutter_arquitetura/infrastructure/dal/entity/climate_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'sqlite_floor_connection.g.dart'; // the generated code will be there

@Database(
  version: 1,
  entities: [
    ClimateEntity,
  ],
)
abstract class SqliteFloorConnection extends FloorDatabase {
  ClimateDao get climateDao;
}
