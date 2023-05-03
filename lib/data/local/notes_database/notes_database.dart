import 'package:sqflite/sqflite.dart';

class DataBase{
  late  Database DB;
  List<Map> data=[];
  createTable()  {

    openDatabase("To77Do.db",
        version: 1,
        onCreate: (database, version)
        {

          // table Tasks
          database.execute('CREATE TABLE Tasks(id INTEGER PRIMARY KEY,task TEXT,time TEXT ,date TEXT,status TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error){
            print('Table Don\'t Created');
          });
        },
        onOpen: (database){
          getDB(database);
          // .then((value) {
          //   data=value;
          //   //print(data);
          //   emit(appgetdatabasestate());
          // });
          print('Table Opened');
        }
    ).then((value) {
      DB=value;
      // emit(appcreatedatabasestate());
    });
  }

  insertData({required String task,required String time,required String date})async{
    await DB.transaction((txn) {
      return   txn.rawInsert('INSERT INTO Tasks(task,time,date,status) VALUES("$task","$time","$date","new")')
          .then((value) {
        print('inseted $value');
   //emit(appinsertdatabasestate());
        getDB(DB);
        //     .then((value) {
        //   data=value;
        //   print(data);
        //   emit(appgetdatabasestate());
        // });



      })
          .catchError((error){
        print('error occure ');
      });
    }

    );
  }

  void getDB(database)async{
   data=[];

   await database.rawQuery('SELECT * FROM Tasks').then((value) {
      value.forEach((element)
      {
        data.add(element);
        //emit(appgetdatabasestate());
      });
   });
  }


  upDB({required String status,required int id})
  async{

    await DB.rawUpdate( 'UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status', id, ])
        .then((value) {
      getDB(DB);
      // emit(appupdatedatabasestate());
    });

  }



}