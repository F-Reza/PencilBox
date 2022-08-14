import 'package:contact/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DBHelper{
  static const _createTableContact = '''
  create table $tableContact(
  $tableContactColId integer primary key,
  $tableContactColName text,
  $tableContactColNumber text,
  $tableContactColEmail text,
  $tableContactColaAddress text,
  $tableContactColDob text,
  $tableContactColGender text,
  $tableContactColImage text,
  $tableContactColFav integer
  )
  ''';

  static Future<Database> open() async {

    final root = await getDatabasesPath();

    final dbPath = Path.join(root, 'contact.db');

    return openDatabase(dbPath,version: 1,onCreate: (db,version){

      db.execute(_createTableContact);

    });
  }

  static Future<int> insertContact(ContactModel contactModel) async {
    final db = await open();
    return db.insert(tableContact, contactModel.toMap());
  }
}