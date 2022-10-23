import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/note_model.dart';
import '../../../../styles.dart';
import '../../../widgets/base_card.dart';
import 'bloc/notes_bloc.dart';

class NotesFragment extends StatelessWidget {
  const NotesFragment({super.key});

  Widget notesMapper(NoteModel note) => NoteCard(note);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state is NoteAddSuccess) {
          Navigator.of(context).pop();
        }
        if (state is NoteAddFail) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Ошибка:\n${state.error}'),
          ));
        }
      },
      buildWhen: (prev, next) => next is NotesSuccess,
      builder: (context, state) {
        if (state is NotesSuccess) {
          return Column(
            children: state.notes.map(notesMapper).toList(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          if (note.imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: CachedNetworkImage(imageUrl: note.imageUrl!),
            ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(note.description),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.image_outlined, color: Styles.greyColor),
                    SizedBox(width: 20),
                    //Icon(Icons.palette_outlined, color: Styles.greyColor),
                    //SizedBox(width: 20),
                    Icon(Icons.delete_outlined, color: Styles.greyColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
