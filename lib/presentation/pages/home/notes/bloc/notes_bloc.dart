import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

@injectable
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final Repository _repository;

  NotesBloc(this._repository) : super(NotesInitial()) {
    on<NotesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
