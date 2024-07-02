import 'package:flutter/material.dart';

/// Clase que almacena las notas musicales
/// incluyendo el color, el texto que la representa y el audio que 
/// se debe reproducir cuando se presione la nota.
class Note {
  static List<Note> get notes => [
        Note._(color: const Color(0xFF017DBF), text: 'C - Do', audio: 'sounds/1_c.wav'),
        Note._(color: const Color(0xFF6001BF), text: 'D - Re', audio: 'sounds/2_d.wav'),
        Note._(color: const Color(0xFFBF01AC), text: 'E - Mi', audio: 'sounds/3_e.wav'),
        Note._(color: const Color(0xFFBF3A01), text: 'F - Fa', audio: 'sounds/4_f.wav'),
        Note._(color: const Color(0xFFBF5C01), text: 'G - Sol', audio: 'sounds/5_g.wav'),
        Note._(color: const Color(0xFF99BF01), text: 'A - La', audio: 'sounds/6_a.wav'),
        Note._(color: const Color(0xFF01BF1F), text: 'B - Si', audio: 'sounds/7_b.wav'),
      ];

  final Color color;
  final String text;
  final String audio;

  Note._({required this.color, required this.text, required this.audio});
}

