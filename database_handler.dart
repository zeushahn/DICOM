import 'package:must_eat_place_app/model/address.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'address.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table address(id integer primary key autoincrement, name text, phone text, estimate text, lat real, lng real, image blob, actiondate text)");
      },
      version: 1,
    );
  } // ----

  insertAddress(Address address) async {
    final Database db = await initializeDB();
    await db.rawInsert(
        "insert into address(name, phone, estimate, lat, lng, image, actiondate) values (?,?,?,?,?,?,datetime('now', 'localtime'))",
        [
          address.name,
          address.phone,
          address.estimate,
          address.lat,
          address.lng,
          address.image
        ]);
  } // ----

  Future<List<Address>> queryAddress() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from address');
    return queryResult.map((e) => Address.fromMap(e)).toList();
  } // ----

  Future deleteAddress(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete('delete from address where id = ?', [id]);
  } // ----

  Future updateAddress(Address address) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        "update address set name = ?, phone = ?, estimate = ?, lat = ?, lng = ?, actiondate = datetime('now', 'localtime') where id = ?",
        [
          address.name,
          address.phone,
          address.estimate,
          address.lat,
          address.lng,
          address.id
        ]);
  } // ---

  Future updateAddressAll(Address address) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        "update address set name = ?, phone = ?, estimate = ?, lat = ?, lng = ?, image = ?, actiondate = datetime('now', 'localtime') where id = ?",
        [
          address.name,
          address.phone,
          address.estimate,
          address.lat,
          address.lng,
          address.image,
          address.id
        ]);
  } // ---
} // DatabaseHandler
