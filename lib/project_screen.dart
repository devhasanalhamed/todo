import 'dart:developer';

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
    return BlocConsumer<ProjectCubit, ProjectState>(
      listener: (context, state) {
        log('cubit listener: something has been changed!');
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
            duration: const Duration(milliseconds: 3000),
          ),
        );
      },
      builder: (context, state) {
        var cubit = ProjectCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SearchCard(),
                TextButton(
                  onPressed: () => cubit.insertToDatabase(
                    title: 'You Are Awesome',
                    description: 'with patience every dream comes true',
                    date: '11/11',
                    time: '11:11',
                  ),
                  child: const Text('INSERT INTO TABLE'),
                ),
                TextButton(
                  onPressed: () => cubit.readFromDatabase(),
                  child: const Text('READ FROM TABLE'),
                ),
                TextButton(
                  onPressed: () => cubit.updateIntoDatabase(
                    id: 1,
                    title: 'You Are On Fire 🔥',
                    description: 'You proved that success is a matter of time',
                    date: '11-11-2023',
                    time: '11:11',
                  ),
                  child: const Text('UPDATE INTO DATABASE'),
                ),
                TextButton(
                  onPressed: () => cubit.deleteFromDatabase(id: 1),
                  child: const Text('DELETE FROM DATABASE'),
                ),
                TextButton(
                  onPressed: () => cubit.deleteDB(),
                  child: const Text('DELETE DATABASE'),
                ),
              ],
            ),
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
        );
      },
    );
  }
}
