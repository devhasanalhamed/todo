import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/global/theme/theme_data/theme_data_light.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/project_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProjectCubit()..createDatabase(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo',
        theme: getThemeDataLight,
        home: const ProjectScreen(),
      ),
    );
  }
}
