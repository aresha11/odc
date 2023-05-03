import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/Bottomstate.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class BottomSheetCubit extends Cubit<BottomSheetState>{
  BottomSheetCubit():super(appinitialstate());
  List<Map> Notes=[];
  bool isbottomsheetshown = false;
  IconData fabicon = Icons.edit;

  void changebottomsheetstate({required bool isshown,required IconData icon}){
    isbottomsheetshown=isshown;
    fabicon=icon;
    emit(appbottomsheetstate());
  }


  late  Database DB;

  createTable() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Notes.db');
    print(path);
    openDatabase(path,
        version: 2,
        onCreate: (database, version)
        {

          // table Tasks
          database.execute('CREATE TABLE Notes(id INTEGER PRIMARY KEY,title TEXT,description TEXT,date TEXT,time TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error){
            print('Table Don\'t Created');
          });
        },
        onOpen: (database){
          getDB(database);
          print('Table Opened');
        }
    ).then((value) {
      DB=value;
      emit(appcreatedatabasestate());
    });
  }

  insertData({required String title,required String description,required String date,required String time})async{
    await DB.transaction((txn) {
      //return   txn.rawInsert('INSERT INTO Notes(title,description) VALUES("$title","$description",)')
      return     txn.rawInsert('INSERT INTO Notes(title,description,date,time) VALUES("$title","$description","$date","$time")')
          .then((value) {
        print('inserted $value');
        emit(appinsertdatabasestate());
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

   getDB(database)async{
     Notes=[];
    await database.rawQuery('SELECT * FROM Notes').then((value) {
      value.forEach((element)
      {


          Notes.add(element);
          print(Notes);

      });


      emit(appgetdatabasestate());
    });
  }


  upDB({required String title,required String description,required int id})
  async{

    await DB.rawUpdate( 'UPDATE Notes SET title= ?,description=?  WHERE id = ?',
        ['$title','$description', id, ]);

      getDB(DB);


    emit(appupdatedatabasestate());

  }
  // upDB({required String status,required int id})
  // async{
  //
  //   await DB.rawUpdate( 'UPDATE Notes SET status = ? WHERE id = ?',
  //       ['$status', id, ])
  //       .then((value) {
  //     getDB(DB);
  //     emit(appupdatedatabasestate());
  //   });
  //
  // }



 deleteDB({id})async{
    //await DB.rawDelete("Delete * from Notes").then((value) => (value) {
    await DB.rawDelete('DELETE FROM Notes WHERE id = ?', ['$id']);
    getDB(DB);
    emit(appdeleteatabasestate());
 }


}