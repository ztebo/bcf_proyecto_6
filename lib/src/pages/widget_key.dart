import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Clase que representa una tecla de la marimba
/// con su color, nombre y audio que se reproducira cuando la tecla sea presionada.
/// [keyColor] Color de la tecla
/// [name] Nombre de la tecla
/// [audioPath] Ruta del audio que se reproducira cuando la tecla sea presionada
class WidgetKey extends StatefulWidget {
   const WidgetKey({
    super.key,
    required this.keyColor,
    required this.name,
    required this.audioPath
  });

  final Color keyColor;
  final String name;
  final String audioPath;

  @override
  State<StatefulWidget> createState() => _WidgetKeyState();
}

class _WidgetKeyState extends State<WidgetKey> with SingleTickerProviderStateMixin {
  final player = AudioPlayer();                   // Objeto tipo AudioPlayer
  bool _animate = false;                          // Controla el estado de la animación
  late AnimationController _animationController;  // Controlador de la animación
  

  /// Inicializa el controlador de la animación
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
  }

  /// Reproduce el audio de la nota
  Future<void> playNote() async{
    debugPrint('Tocando nota: ${widget.name}');
    
    await player.stop();
    await player.setSource(AssetSource(widget.audioPath));
    await player.resume();

  }

  /// Controla el estado de la animación en el momento en que se deja de presionar la nota.
  void animateNoteUp(TapUpDetails details) {
    debugPrint('Soltando nota: ${widget.name}');
     setState(() {
       _animate = false;
     });     
  }

  /// Controla el estado de la animación en el momento en que se presiona la nota.
  void animateNoteDown(TapDownDetails details) {
    debugPrint('Soltando nota: ${widget.name}');
     setState(() {
       _animate = true;
     });     
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: playNote,
      onTapDown: (TapDownDetails details) => animateNoteDown(details),
      onTapUp: (TapUpDetails details) => animateNoteUp(details),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _animate?0.9:1.0,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: widget.keyColor.withOpacity(0.8),
                    backgroundBlendMode: BlendMode.srcOver,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: widget.keyColor,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/key_design_1.png',                
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}

