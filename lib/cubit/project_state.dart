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

class SuccessInsertToDatabase extends ProjectState {
  SuccessInsertToDatabase({required super.message});
}

class ReadFromDatabase extends ProjectState {
  ReadFromDatabase({required super.message});
}

class LoadingReadingDataFromDatabase extends ProjectState {
  LoadingReadingDataFromDatabase({required super.message});
}

class SuccessReadDataFromDatabase extends ProjectState {
  SuccessReadDataFromDatabase({required super.message});
}

class UpdateIntoDatabase extends ProjectState {
  UpdateIntoDatabase({required super.message});
}

class DeleteFromDatabase extends ProjectState {
  DeleteFromDatabase({required super.message});
}

class ChangeLanguageToArabic extends ProjectState {
  ChangeLanguageToArabic({required super.message});
}

class ChangeLanguageToEnglish extends ProjectState {
  ChangeLanguageToEnglish({required super.message});
}

class ChangeThemeMode extends ProjectState {
  ChangeThemeMode({required super.message});
}
