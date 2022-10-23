import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/note_model.dart';
import '../../../../../domain/repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

@injectable
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final Repository _repository;

  List<NoteModel> _notes = [];

  StreamSubscription? _notesSubscription;

  NotesBloc(this._repository) : super(NotesInitial()) {
    on<NotesInit>(_init);
    on<AddNote>(_addNote);
  }

  void _init(NotesInit event, Emitter<NotesState> emit) async {
    final notes = await _repository.getAllNotes();
    emit(NotesSuccess(notes));
    _notesSubscription?.cancel();
    _notesSubscription = _repository.notes.stream.listen((v) {
      _notes = v;
      add(NotesFetched(_notes));
    });
  }

  void _addNote(AddNote event, Emitter<NotesState> emit) async {
    final user = await _repository.currentUser.first;
    final note = NoteModel(
      id: 0,
      name: event.title,
      description: event.description,
      userId: user.id ?? 1,
    );

    try {
      await _repository.addNote(note);
      emit(NoteAddSuccess());
    } on DioError catch (e) {
      emit(NoteAddFail(e.message));
    }
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
