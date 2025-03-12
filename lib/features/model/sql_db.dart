import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _qurandb;
  Future<Database?> get qurandb async {
    if (_qurandb != null) return _qurandb;
    _qurandb = await initialDb();
    return _qurandb;
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'quran.db');
    // Create a database with the specified name and open it
    Database qurandb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _onupgrade);
    return qurandb;
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    // Run migration according database versions
    if (oldversion < newversion) {
      // Run the migration according database versions
    }

    // ignore: avoid_print
    print("-----------------onupgrade-----------------");
  }

  _oncreate(Database db, int version) async {
    // When creating the db, create the table
    Batch batch = db.batch();
    batch.execute('''
          CREATE TABLE quran (
          "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          "surah" TEXT,
          "ayah" TEXT,
          "translation" TEXT,
          "audio" TEXT,
          )''');
    // batch.execute('''
    //       CREATE TABLE duaa (
    //       "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    //       "duaa" TEXT,
    //       "translation" TEXT,
    //       )''');
    // ignore: avoid_print
    print("-----------------created-----------------");
  }

  readdata(String sql) async {
    final Database? mydb = await qurandb;
    final List<Map<String, dynamic>> maps = await mydb!.rawQuery(sql);
    return List.generate(maps.length, (i) {
      return maps[i];
    });
  }

  insertdata(String sql) async {
    final Database? mydb = await qurandb;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updatedata(String sql) async {
    final Database? mydb = await qurandb;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deletedata(String sql) async {
    final Database? mydb = await qurandb;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
