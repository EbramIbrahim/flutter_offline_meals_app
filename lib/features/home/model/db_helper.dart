import 'package:meals_app/features/home/model/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals_db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int verstion) async {
    await db.execute('''
      CREATE TABLE meals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT,
        name TEXT,
        description TEXT,
        rate REAL,
        time TEXT
      )
''');
  }

  Future<int> insertMeals(Meal meal) async {
    final db = await database;
    Map<String, dynamic> mealsMap = meal.toMap();
    return await db.insert('meals', mealsMap);
  }

  Future<List<Meal>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealsJson = await db.query('meals');
    List<Meal> meals =
        mealsJson.map((mealJson) => Meal.fromMap(mealJson)).toList();
    return meals;
  }
}
