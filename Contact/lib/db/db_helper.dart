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
  $tableContactColWebsite text,
  $tableContactColFav integer
  )
  ''';


  static Future<Database> open() async {
    final root = await getDatabasesPath();

    final dbPath = Path.join(root, 'contact.db');

    // return openDatabase(dbPath,version: 1,onCreate: (db,version){
    //   db.execute(_createTableContact);
    // });
    return openDatabase(dbPath, version: 2, onCreate: (db, version) {
      db.execute(_createTableContact);
    }, onUpgrade: (db, oldV, newV) {
      if (newV == 2) {
        db.execute(
            'alter table $tableContact add column $tableContactColWebsite text');
      }
      // if (newV == 3) {
      // }
    });
  }


  static Future<int> insertContact(ContactModel contactModel) async {
    final db = await open();
    return db.insert(tableContact, contactModel.toMap());
  }


  static Future<List<ContactModel>> getAllContacts() async {
    final db = await open();
    final mapList = await db.query(tableContact, orderBy: '$tableContactColName asc');
    return List.generate(mapList.length, (index) =>
        ContactModel.fromMap(mapList[index])
    );
  }


  static Future<List<ContactModel>> getAllFavoriteContacts() async {
    final db = await open();
    final mapList = await db.query(
        tableContact, where: '$tableContactColFav = ?', whereArgs: [1],
        orderBy: '$tableContactColName asc');

    return List.generate(mapList.length, (index) =>
        ContactModel.fromMap(mapList[index])
    );
  }


  static Future<ContactModel> getContactById(int id) async {
    final db = await open();
    final mapList = await db.query
      (tableContact,where: '$tableContactColId = ?', whereArgs: [id]);
    return ContactModel.fromMap(mapList.first);
  }


  static Future<int> updateFavorite(int id, int value) async {
    final db = await open();
    return db.update(tableContact,
        {tableContactColFav : value},
        where: '$tableContactColId = ?', whereArgs: [id]);
  }


  static Future<int> deleteContact(int id) async {
    final db = await open();
    return db.delete(tableContact,
        where: '$tableContactColId = ?',
        whereArgs: [id]);
  }

}