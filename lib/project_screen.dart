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
              appBar: AppBar(),
              body: Center(
                child: TextButton(
                  onPressed: () => cubit.createDatabase(),
                  child: const Text('Create Database'),
                ),
              ));
        });
  }
}
