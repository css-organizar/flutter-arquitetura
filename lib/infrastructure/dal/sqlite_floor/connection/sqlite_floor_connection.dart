import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/dao/climate_dao.dart';
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/entity/climate_entity.dart';

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
