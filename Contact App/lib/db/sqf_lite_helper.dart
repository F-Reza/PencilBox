import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DBHelper{
  static const _createTableContact = '''...''';

  static Future<Database> open() async {

    final root = await getDatabasesPath();

    final dbPath = Path.join(root, 'contact.db');

    return openDatabase(dbPath,version: 1,onCreate: (db,version){

      db.execute(_createTableContact);

    });
  }
}