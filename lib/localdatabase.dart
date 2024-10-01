import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Item_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'app_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY, title TEXT, shortDescription TEXT, mainImageURL TEXT)',
        );
      },
    );
  }

  Future<void> insertItems(List<ItemModel> items) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var item in items) {
        await txn.insert('items', item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    });
  }

  Future<List<ItemModel>> getItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    return List.generate(maps.length, (i) {
      return ItemModel.fromMap(maps[i]);
    });
  }
}
