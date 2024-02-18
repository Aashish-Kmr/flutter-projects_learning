import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber){
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({color1,soundNumber}){
    return Expanded(
      child: Container(
        color: color1,
        child: TextButton(
          onPressed:(){
            playSound(soundNumber);
          }, child: const Text(''),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildKey(color1: Colors.red, soundNumber: 1 ),
              buildKey(color1: Colors.orange, soundNumber: 2),
              buildKey(color1: Colors.yellow, soundNumber: 3),
              buildKey(color1: Colors.green, soundNumber: 4),
              buildKey(color1: Colors.teal, soundNumber: 5),
              buildKey(color1: Colors.blue, soundNumber: 6),
              buildKey(color1: Colors.purple, soundNumber: 7),
            ],
          ),

        ),
      ),
    );
  }
}
