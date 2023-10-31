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

  int currentIndex = 0;

  final List<String> appBarTitles = [
    'Home',
    'Cities',
    'Settings',
  ];

  final List<Widget> screens = [
    const HomepageScreen(),
    const CitiesScreen(),
    const SettingsScreen(),
  ];

  void bottomNavigationOnTap(int? index) {
    currentIndex = index!;
    emit(BottomNavigationState());
  }

  void createDatabase() {
    openDatabase('');
  }
}
