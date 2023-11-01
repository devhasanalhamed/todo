import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/cubit/project_state.dart';
import 'package:todo/presentation/screens/cities_screen.dart';
import 'package:todo/presentation/screens/homepage_screen.dart';
import 'package:todo/presentation/screens/settings_screen.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(InitialProjectState());

  static ProjectCubit get(context) => BlocProvider.of(context);


  Database? database;

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        db.execute("""
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY,
          title TEXT, 
          date TEXT,
          time TEXT
        )
        """);
        log('table created');
      },
      onOpen: (db) {
        log('database opened');
      },
    ).then((value) => database = value);
    emit(CreateDatabase());
  }
}
