part of 'notes_bloc.dart';

abstract class NotesEvent {
  const NotesEvent();
}

class NotesInit extends NotesEvent {}

class AddNote extends NotesEvent {
  final String title;
  final String description;

  const AddNote({required this.title, required this.description});
}
