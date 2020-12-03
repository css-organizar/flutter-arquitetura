import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/application/constants/constants.dart';
import 'package:flutter_arquitetura/infrastructure/dal/sqlite_floor/connection/sqlite_floor_connection.dart';
import 'package:flutter_arquitetura/presentation/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SqliteFloorConnection database = await $FloorSqliteFloorConnection.databaseBuilder(databaseName).build();

  runApp(
    AppWidget(
      database: database,
    ),
  );
}
