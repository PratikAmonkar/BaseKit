import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// TODO:: add sqflite and path dependency in pubspec.yaml file compatible version : [  sqflite: ^2.3.3,path: ^1.9.0]

class DatabaseConfiguration {
  static const String databaseName = "database_name.db";
  static Database? db;

  static Future<Database> initializeDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db ??
        await openDatabase(
          path,
          version: 1,
          onCreate: (Database db, int version) async {
            await createTables(db);
          },
        );
  }

  static Future<void> createTables(Database database) async {
    // TODO:: Sample
/*    await database.execute("""
      CREATE TABLE IF NOT EXISTS Attendance (
        attendanceId TEXT PRIMARY KEY,
        userId TEXT,
        companyName TEXT,
        checkInTime TEXT,
        checkOutTime TEXT,
        workingHours TEXT,
        officeInTime TEXT,
        officeOutTime TEXT,
        officeHours TEXT,
        createdDate TEXT,
        updatedDate TEXT,
        type TEXT
      );
    """);*/
  }
}
