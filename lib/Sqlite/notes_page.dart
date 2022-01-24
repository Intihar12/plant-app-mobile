import 'package:getdata/Sqlite/sqlmodalss/sqlitems.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'usersix.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE usersix(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

 /* Future<int> insertSingleUser(User user) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('usersix', user.toMap());
    return result;
  }*/

  Future<int?> insertSingleUser(User user) async {

    final Database db = await initializeDB();
    await db.insert('usersix', user.toMap());

  }



  Future<List<User>> retrieveUser(String id, String email) async {
    final Database db = await initializeDB();
    List<Map<String, Object?>> list = await db.rawQuery('SELECT * FROM usersix WHERE id = ?', [id]);
    return list.map((e) => User.fromMap(e)).toList();
  }

  Future<List<User>> retrieveUsers(String name, String email) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('usersix');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<int?> deleteitems(int id) async {
    final Database db = await initializeDB();

     await db
        .rawDelete('DELETE FROM usersix WHERE id = ?', [id]);

  }
void updateData ( String name, String email, int id)async{
  final Database database = await initializeDB();

 database.rawUpdate(
  'UPDATE usersix SET name = ?, email = ?  WHERE id = ? ',  [name, email,  id]);

print("id = ");
print(id);
print("name = " + name);
print("email= " + email);
  }

}