import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/cubit/project_state.dart';
import 'package:todo/presentation/screens/add_tasks_screen.dart';
import 'package:todo/presentation/widgets/search_card.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTasksScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<ProjectCubit, ProjectState>(
        listener: (context, state) {
          log('cubit listener: something has been changed!');
        },
        builder: (context, state) {
          var cubit = ProjectCubit.get(context);
          return ConditionalBuilder(
            condition: state is! SuccessReadDataFromDatabase,
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
            builder: (context) => cubit.tasks.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_empty),
                        Text('No Tasks Yet'),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      const SearchCard(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.tasks.length,
                          itemBuilder: (context, index) => Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      onPressed: () => cubit.deleteFromDatabase(
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
                    ],
                  ),
          );
        },
      ),
    );
  }
}
