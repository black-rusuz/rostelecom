part of 'notes_bloc.dart';

abstract class NotesEvent {
  const NotesEvent();
}

class AddNote extends NotesEvent {}
