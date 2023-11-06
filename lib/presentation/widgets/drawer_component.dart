import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/cubit/project_state.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProjectCubit.get(context);
        return Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () => cubit.changeLanguageToArabic(context),
                      child: const Text('AR 🇸🇦')),
                  const SizedBox(),
                  TextButton(
                      onPressed: () => cubit.changeLanguageToEnglish(context),
                      child: const Text('EN 🇺🇸')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
