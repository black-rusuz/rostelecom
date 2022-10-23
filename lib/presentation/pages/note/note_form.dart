import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_text_field.dart';

class NoteForm extends StatelessWidget {
  static const String name = '/new_note';

  const NoteForm({super.key});

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
          children: const [
            BaseTextField('Название'),
            SizedBox(height: 12),
            BaseTextField('Описание', lines: 10),
            SizedBox(height: 40),
            BaseButton(
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
