import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

class WidgetKey extends StatelessWidget {
  // Dentro de los constructores se encuentran: el color, el nombre de la nota 
  WidgetKey({
    super.key,
    required this.keyColor,
    required this.name,
    required this.audioPath
  });

  final Color keyColor;
  final String name;
  final String audioPath;

  final AudioPlayer player = AudioPlayer();


  // Función playAudio
  void playAudio() async {
    debugPrint('Tocando la nota $name');
    await player.setSource(AssetSource(audioPath));
    await player.resume();
    //await player.play(DeviceFileSource(audioPath));
    //await player.stop();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playAudio,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: keyColor.withOpacity(0.8), // Agrega transparencia al color
              backgroundBlendMode: BlendMode.srcOver,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: keyColor,
              ),
            )
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

