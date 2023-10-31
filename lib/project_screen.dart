import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/cubit/project_state.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProjectCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appBarTitles[cubit.currentIndex]),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => cubit.bottomNavigationOnTap(value),
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_city),
                  label: 'Cities',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
        });
  }
}
