import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
void navigateTo(context, widget) => Navigator.push(
    context,
    /*current widget*/
    /*widget : the next widget */
    MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
//validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
      ),
    );

Database? database;
void createDB() async {
  database = await openDatabase('Bank.db', version: 1,
      onCreate: (database, int version) async {
        print('database created');
        await database
            .execute(
            'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, email TEXT, coin REAL,phone TEXT)')
            .then((value) {
          print('user created');
        }).catchError((error) {
          print('error when user table created ${error.toString()}');
        });
      }, onOpen: (database) {
        getfromDB(database).then((value) {
          print('data base opened');
        });
      });
}

Future<int?> insertonDB() async {
  await database!.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO user(name,email, coin,phone) VALUES("Aromal","aromal@gmail.com", 800,"0123456789")');

    print('inserted1: $id1');

    int id2 = await txn.rawInsert(
        'INSERT INTO user(name,email,coin,phone) VALUES("Arun","arun@gmail.com",900,"0123456789")');

    print('inserted2: $id2');

    int id3 = await txn.rawInsert(
        'INSERT INTO user(name,email,phone, coin) VALUES("Soumya","soumu@gmail.com","0123456789", 400)');

    print('inserted3: $id3');

    int id4 = await txn.rawInsert(
        'INSERT INTO user(name,email,phone, coin) VALUES("Manu Shankar","manu@gmail.com", "0123456789", 700)');

    print('inserted4: $id4');

    int id5 = await txn.rawInsert(
        'INSERT INTO user(name,email, phone, coin) VALUES("Malavika","malu@gmail.com","0123456789", 40000)');

    print('inserted5: $id5');

    int id6 = await txn.rawInsert(
        'INSERT INTO user(name,email, coin,phone) VALUES("Aromal","aromal@gmail.com", 800,"0123456789")');

    print('inserted6: $id6');

    int id7 = await txn.rawInsert(
        'INSERT INTO user(name,email,coin,phone) VALUES("Arun","arun@gmail.com",900,"0123456789")');

    print('inserted7: $id7');

    int id8 = await txn.rawInsert(
        'INSERT INTO user(name,email,phone, coin) VALUES("Manu Shankar","manu@gmail.com", "0123456789", 700)');

    print('inserted8: $id8');

    int id9 = await txn.rawInsert(
        'INSERT INTO user(name,email,phone, coin) VALUES("Soumya","soumu@gmail.com","0123456789", 400)');

    print('inserted9: $id9');

    int id10 = await txn.rawInsert(
        'INSERT INTO user(name,email, phone, coin) VALUES("Malavika","malu@gmail.com","0123456789", 40000)');

    print('inserted10: $id10');
  });
}

Future<List<Map>?> getfromDB(database) async {
  list = await database.rawQuery('SELECT * FROM user');
}