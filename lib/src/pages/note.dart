import 'package:flutter/material.dart';

class Note {
  static List<Note> get notes => [
        Note._(color: const Color(0xFF017DBF), text: 'C - Do', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFF6001BF), text: 'D - Re', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFFBF01AC), text: 'E - Mi', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFFBF3A01), text: 'F - Fa', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFFBF5C01), text: 'G - Sol', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFF99BF01), text: 'A - La', audio: 'sounds/test.mp3'),
        Note._(color: const Color(0xFF01BF1F), text: 'B - Si', audio: 'sounds/test.mp3'),
      ];

  final Color color;
  final String text;
  final String audio;

  Note._({required this.color, required this.text, required this.audio});
}

