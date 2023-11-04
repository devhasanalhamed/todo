import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/cubit/project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(InitialProjectState(message: ''));

  static ProjectCubit get(context) => BlocProvider.of(context);

  Database? database;

  void deleteDB() {
    deleteDatabase('todo.db').then((value) {
      log('database deleted');
      createDatabase();
    }).onError((error, stackTrace) {
      log('an error occurred deleting database $error');
    });
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        db.execute("""
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY,
          title TEXT, 
          description TEXT,
          date TEXT,
          time TEXT
        );
        """);
        log('table created');
      },
      onOpen: (database) {
        log('database opened');
        readFromDatabase(database);
      },
    ).then((value) => database = value);
    emit(CreateDatabase(message: ''));
  }

  void insertToDatabase({
    required String title,
    required String description,
    required String date,
    required String time,
  }) {
    database!.transaction((txn) async {
      txn.rawInsert("""
      INSERT INTO tasks
      (title, description, date, time) VALUES
      ('$title', '$description', '$date', '$time');
      """).then((value) {
        log('$value');
        emit(InsertToDatabase(message: 'Insert Has Been Done Successfully'));
      }).onError((error, stackTrace) {
        log('$error');
      });
    });
  }

  List<Map<String, Object?>> tasks = [];

  void readFromDatabase(database) async {
    database.rawQuery("""
      SELECT * FROM tasks
    """).then((value) {
      log('Data has been fetched');
      log('$value');
      tasks = value.toList();
      emit(ReadFromDatabase(message: '$value'));
    }).onError((error, stackTrace) {
      log('Error has been ocurred  $error');
    });
  }

  void updateIntoDatabase({
    required int id,
    required String title,
    required String description,
    required String date,
    required String time,
  }) {
    database!
        .update(
      'tasks',
      {
        'title': title,
        'description': description,
        'date': date,
        'time': time,
      },
      where: 'id = ?',
      whereArgs: [id],
    )
        .then((value) {
      log('successfully updated');
      log('$value');
      readFromDatabase(database);
      emit(UpdateIntoDatabase(message: 'You Update Has Been Done'));
    }).onError((error, stackTrace) {
      log('error occurred while updating $error');
    });
  }

  void deleteFromDatabase({
    required int id,
  }) {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      log('row deleted successfully');
      readFromDatabase(database);
      emit(DeleteFromDatabase(message: 'Row Deleted Successfully'));
    }).onError((error, stackTrace) {
      log('error occurred while deleting data $error');
    });
  }
}
