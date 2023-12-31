import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/cubit/project_state.dart';
import 'package:todo/model/task_model.dart';

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
        readFromDatabase(database);
        emit(SuccessInsertToDatabase(
            message: 'Insert Has Been Done Successfully'));
      }).onError((error, stackTrace) {
        log('$error');
      });
    });
  }

  List<TaskModel> tasks = [];

  void readFromDatabase(database) async {
    emit(
      LoadingReadingDataFromDatabase(message: 'Fetching data in a second'),
    );
    tasks = [];
    database.rawQuery("""
      SELECT * FROM tasks
    """).then((value) {
      log('Data has been fetched');
      log('$value');
      tasks = List.from(value.map((task) => TaskModel.fromSQL(task)));
      emit(SuccessReadDataFromDatabase(message: '$value'));
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

  void changeLanguageToArabic(BuildContext context) {
    if (context.locale == const Locale('en', 'US')) {
      context.setLocale(const Locale('ar', 'SA'));
      emit(ChangeLanguageToArabic(message: 'language has been changed'));
    }
  }

  void changeLanguageToEnglish(BuildContext context) {
    if (context.locale == const Locale('ar', 'SA')) {
      context.setLocale(const Locale('en', 'US'));
      emit(ChangeLanguageToEnglish(message: 'language has been changed'));
    }
  }

  bool isDarkMode = false;
  void changeThemeMode(bool? prefBool) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (prefBool != null) {
      isDarkMode = prefBool;
    } else {
      isDarkMode = !isDarkMode;
    }
    await pref.setBool("prefBool", isDarkMode);
    emit(ChangeThemeMode(message: 'theme mode has been changed'));
  }
}
