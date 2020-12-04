import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/application/app_widget.dart';
import 'package:flutter_arquitetura/infrastructure/dal/dao/sqlite_floor/sqlite_floor_connection.dart';

import 'application/common/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SqliteFloorConnection database = await $FloorSqliteFloorConnection.databaseBuilder(databaseName).build();

  runApp(
    AppWidget(
      database: database,
    ),
  );
}
