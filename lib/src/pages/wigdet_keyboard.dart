import 'package:bcf_proyecto_6/src/pages/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widget_key.dart';

class WigdetKeyboard extends StatelessWidget {
  const WigdetKeyboard({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          Note.notes.length,
          (index) => WidgetKey(
            keyColor: Note.notes[index].color,
            name: Note.notes[index].text,
            audioPath: Note.notes[index].audio,
          ),
        ),
      ),
    );
  }


}