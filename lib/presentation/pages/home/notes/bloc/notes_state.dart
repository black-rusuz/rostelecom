part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  const NotesSuccess(this.notes);

  @override
  List<Object> get props => notes;
}

class NoteAddSuccess extends NotesState {}

class NoteAddFail extends NotesState {
  final String error;

  const NoteAddFail(this.error);

  @override
  List<Object> get props => [
        UniqueKey(),
        error,
      ];
}
