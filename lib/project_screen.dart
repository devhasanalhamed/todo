import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/cubit/project_state.dart';
import 'package:todo/presentation/screens/add_task_screen.dart';
import 'package:todo/presentation/screens/update_task_screen.dart';
import 'package:todo/presentation/widgets/drawer_component.dart';
import 'package:todo/presentation/widgets/search_card.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
      listener: (context, state) {
        log('cubit listener: something has been changed!');
      },
      builder: (context, state) {
        var cubit = ProjectCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('appTitle'.tr()),
            actions: [
              IconButton(
                onPressed: () => cubit.changeThemeMode(null),
                icon: cubit.isDarkMode
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              ),
            ],
          ),
          drawer: const DrawerComponent(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: ConditionalBuilder(
            condition: state is LoadingReadingDataFromDatabase,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
            fallback: (context) => cubit.tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.hourglass_empty),
                        Text('noTasksYet'.tr()),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      const SearchCard(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.tasks.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateTaskScreen(
                                    id: cubit.tasks[index]['id']),
                              ),
                            ),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cubit.tasks[index]['title'],
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      Text(
                                        cubit.tasks[index]['time'],
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            cubit.deleteFromDatabase(
                                                id: cubit.tasks[index]['id']),
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    cubit.tasks[index]['description'],
                                    style: const TextStyle(
                                      fontSize: 26.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
