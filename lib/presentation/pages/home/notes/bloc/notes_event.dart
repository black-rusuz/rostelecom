part of 'notes_bloc.dart';

abstract class NotesEvent {
  const NotesEvent();
}

class NotesInit extends NotesEvent {}

class NotesFetched extends NotesEvent {
  final List<NoteModel> notes;

  NotesFetched(this.notes);
}

class AddNote extends NotesEvent {
  final String title;
  final String description;

  const AddNote({required this.title, required this.description});
}
