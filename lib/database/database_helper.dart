import 'package:movie_app/model/user_data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableUserData = "userData";

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableUserData ( 
  ${UserDataFields.id} $idType, 
  ${UserDataFields.name} $textType,
  ${UserDataFields.emailId} $textType,
  ${UserDataFields.password} $textType,
  ${UserDataFields.number} $textType,
  ${UserDataFields.profession} $textType
  )
''');
  }

  Future<UserData> create(UserData userData) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableUserData, userData.toMap());
    return userData.copy(id: id);
  }

  Future<UserData> readNote(String email) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUserData,
      columns: UserDataFields.values,
      where: '${UserDataFields.emailId} = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return UserData.fromMap(maps.first);
    } else {
      throw Exception('ID $email not found');
    }
  }

  Future<List<UserData>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${UserDataFields.name} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableUserData, orderBy: orderBy);

    return result.map((json) => UserData.fromMap(json)).toList();
  }

  // Future<int> update(Note note) async {
  //   final db = await instance.database;

  //   return db.update(
  //     tableNotes,
  //     note.toJson(),
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [note.id],
  //   );
  // }

  // Future<int> delete(int id) async {
  //   final db = await instance.database;

  //   return await db.delete(
  //     tableNotes,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
