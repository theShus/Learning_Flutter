import 'dart:async';
import 'dart:io';
import 'package:learning_demo/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class TaskDataBase {
  static final _databaseName = "tasks.db";
  static final _databaseVersion = 1;

  static final table = 'tasks';

  static final columnId = '_id';
  static final columnTitle = 'name';
  static final columnDescription = 'description';
  static final columnUrgency = 'urgency';
  static final columnProgress = 'progress';

  // Make this a singleton class
  TaskDataBase._initSingleton();
  static final TaskDataBase instance = TaskDataBase._initSingleton();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Lazily instantiate the database if unavailable
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database, creating if it doesn't exist
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
           CREATE TABLE $table (
             $columnId INTEGER PRIMARY KEY,
             $columnTitle TEXT NOT NULL,
             $columnDescription TEXT NOT NULL
             $columnDescription TEXT NOT NULL
             $columnDescription TEXT NOT NULL
           )
           ''');
  }

  // Insert a task into the database
  Future<int> insert(Task task) async {
    Database db = await instance.database;
    return await db.insert(table, task.toMap());
  }

  // Retrieve all task from the database
  Future<List<Task>> getAllTasks() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  // Update a task in the database
  Future<int> update(Task task) async {
    Database db = await instance.database;
    return await db.update(table, task.toMap(),
        where: '$columnId = ?', whereArgs: [task.id]);
  }

  // Delete a task from the database
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

}