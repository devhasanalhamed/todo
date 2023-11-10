import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/cubit/project_state.dart';
import 'package:todo/presentation/widgets/text_form_field_component.dart';

class UpdateTaskScreen extends StatelessWidget {
  final int id;
  UpdateTaskScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('editTask'.tr()),
      ),
      body: BlocConsumer<ProjectCubit, ProjectState>(
        listener: (context, state) {
          if (state is UpdateIntoDatabase) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          final cubit = ProjectCubit.get(context);
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Column(
                  children: [
                    TextFormFieldComponent(
                      controller: titleController,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pleaseAddTitle'.tr();
                        }
                        return null;
                      },
                      label: 'title'.tr(),
                      hintText: 'addYourTitle'.tr(),
                      prefixIcon: Icons.title,
                      submit: (value) {},
                    ),
                    const SizedBox(height: 16.0),
                    TextFormFieldComponent(
                      controller: timeController,
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (value) {
                            if (value != null) {
                              timeController.text = value.format(context);
                            } else {
                              timeController.clear();
                            }
                          },
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pleaseAddTime'.tr();
                        }
                        return null;
                      },
                      label: 'time'.tr(),
                      hintText: 'addYourTime'.tr(),
                      prefixIcon: Icons.watch_later,
                      submit: (value) {},
                    ),
                    const SizedBox(height: 16.0),
                    TextFormFieldComponent(
                      controller: dateController,
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse("2040-12-30"),
                        ).then(
                          (value) {
                            if (value != null) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value);
                            } else {
                              dateController.clear();
                            }
                          },
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pleaseAddDate'.tr();
                        }
                        return null;
                      },
                      label: 'date'.tr(),
                      hintText: 'addYourDate'.tr(),
                      prefixIcon: Icons.date_range,
                      submit: (value) {},
                    ),
                    const SizedBox(height: 16.0),
                    TextFormFieldComponent(
                      controller: descriptionController,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pleaseAddDescription'.tr();
                        }
                        return null;
                      },
                      label: 'description'.tr(),
                      maxLines: 2,
                      hintText: 'addYourDescription'.tr(),
                      prefixIcon: Icons.note,
                      submit: (value) {},
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.updateIntoDatabase(
                            id: id,
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                            time: timeController.text,
                          );
                        }
                      },
                      child: Text('update'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
