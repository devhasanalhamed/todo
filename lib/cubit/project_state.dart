abstract class ProjectState {}

class InitialProjectState extends ProjectState {}

class CreateDatabase extends ProjectState {}

class InsertToDatabase extends ProjectState {}

class ReadFromDatabase extends ProjectState {}

class UpdateIntoDatabase extends ProjectState {}

class DeleteFromDatabase extends ProjectState {}
