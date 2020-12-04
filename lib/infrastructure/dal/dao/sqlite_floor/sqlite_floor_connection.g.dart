// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqlite_floor_connection.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorSqliteFloorConnection {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SqliteFloorConnectionBuilder databaseBuilder(String name) =>
      _$SqliteFloorConnectionBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SqliteFloorConnectionBuilder inMemoryDatabaseBuilder() =>
      _$SqliteFloorConnectionBuilder(null);
}

class _$SqliteFloorConnectionBuilder {
  _$SqliteFloorConnectionBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$SqliteFloorConnectionBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SqliteFloorConnectionBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SqliteFloorConnection> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$SqliteFloorConnection();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SqliteFloorConnection extends SqliteFloorConnection {
  _$SqliteFloorConnection([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClimateDao _climateDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `climate` (`climateId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `climateCountry` TEXT, `climateDate` TEXT, `climateText` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ClimateDao get climateDao {
    return _climateDaoInstance ??= _$ClimateDao(database, changeListener);
  }
}

class _$ClimateDao extends ClimateDao {
  _$ClimateDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _climateEntityInsertionAdapter = InsertionAdapter(
            database,
            'climate',
            (ClimateEntity item) => <String, dynamic>{
                  'climateId': item.id,
                  'climateCountry': item.country,
                  'climateDate': item.date,
                  'climateText': item.text
                },
            changeListener),
        _climateEntityUpdateAdapter = UpdateAdapter(
            database,
            'climate',
            ['climateId'],
            (ClimateEntity item) => <String, dynamic>{
                  'climateId': item.id,
                  'climateCountry': item.country,
                  'climateDate': item.date,
                  'climateText': item.text
                },
            changeListener),
        _climateEntityDeletionAdapter = DeletionAdapter(
            database,
            'climate',
            ['climateId'],
            (ClimateEntity item) => <String, dynamic>{
                  'climateId': item.id,
                  'climateCountry': item.country,
                  'climateDate': item.date,
                  'climateText': item.text
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _climateMapper = (Map<String, dynamic> row) => ClimateEntity(
      id: row['climateId'] as int,
      country: row['climateCountry'] as String,
      date: row['climateDate'] as String,
      text: row['climateText'] as String);

  final InsertionAdapter<ClimateEntity> _climateEntityInsertionAdapter;

  final UpdateAdapter<ClimateEntity> _climateEntityUpdateAdapter;

  final DeletionAdapter<ClimateEntity> _climateEntityDeletionAdapter;

  @override
  Future<List<ClimateEntity>> findAll() async {
    return _queryAdapter.queryList('select * from climate',
        mapper: _climateMapper);
  }

  @override
  Stream<List<ClimateEntity>> findAllStream() {
    return _queryAdapter.queryListStream('select * from climate',
        queryableName: 'climate', isView: false, mapper: _climateMapper);
  }

  @override
  Future<void> deleteAllClimates() async {
    await _queryAdapter.queryNoReturn('DELETE FROM climate');
  }

  @override
  Future<void> insertData(ClimateEntity entityInstance) async {
    await _climateEntityInsertionAdapter.insert(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListData(List<ClimateEntity> entityInstance) async {
    await _climateEntityInsertionAdapter.insertList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(ClimateEntity entityInstance) async {
    await _climateEntityUpdateAdapter.update(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListData(List<ClimateEntity> entityInstance) async {
    await _climateEntityUpdateAdapter.updateList(
        entityInstance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(ClimateEntity entityInstance) async {
    await _climateEntityDeletionAdapter.delete(entityInstance);
  }
}
