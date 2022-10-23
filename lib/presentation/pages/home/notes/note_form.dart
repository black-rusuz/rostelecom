import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_text_field.dart';
import 'bloc/notes_bloc.dart';

class NoteForm extends StatelessWidget {
  static const String name = '/new_note';

  NoteForm({super.key});

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Новая заметка',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
        child: ListView(
          children: [
            BaseTextField('Название', controller: title),
            const SizedBox(height: 12),
            BaseTextField('Описание', lines: 10, controller: description),
            const SizedBox(height: 40),
            BaseButton(
              onTap: () => context.read<NotesBloc>().add(AddNote(
                    title: title.text,
                    description: description.text,
                  )),
              label: 'Создать',
              icon: Icons.add,
              bgColor: Styles.darkColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
