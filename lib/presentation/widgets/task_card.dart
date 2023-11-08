import 'package:flutter/material.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/model/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.cubit,
    required this.task,
  });

  final ProjectCubit cubit;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: true,
              onChanged: (val) {},
            ),
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              task.time,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              task.description,
              style: const TextStyle(
                fontSize: 26.0,
              ),
            ),
            IconButton(
              onPressed: () => cubit.deleteFromDatabase(id: task.id),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
