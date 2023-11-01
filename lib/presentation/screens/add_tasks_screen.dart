import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/text_form_field_component.dart';

class AddTasksScreen extends StatelessWidget {
  AddTasksScreen({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          textFormFieldComponent(
            controller: titleController,
            inputType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please add a title';
              }
              return null;
            },
            label: 'title',
            hintText: 'add your title',
            prefixIcon: Icons.title,
            submit: (value) {},
          ),
        ],
      ),
    );
  }
}
