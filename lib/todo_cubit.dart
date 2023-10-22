import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialTodoState());

  String name = 'Hello';
}
