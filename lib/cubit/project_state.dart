abstract class ProjectState {
  final String message;

  ProjectState({required this.message});
}

class InitialProjectState extends ProjectState {
  InitialProjectState({required super.message});
}

class CreateDatabase extends ProjectState {
  CreateDatabase({required super.message});
}

class InsertToDatabase extends ProjectState {
  InsertToDatabase({required super.message});
}

class ReadFromDatabase extends ProjectState {
  ReadFromDatabase({required super.message});
}

class UpdateIntoDatabase extends ProjectState {
  UpdateIntoDatabase({required super.message});
}

class DeleteFromDatabase extends ProjectState {
  DeleteFromDatabase({required super.message});
}
