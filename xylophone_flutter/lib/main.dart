import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XylophoneHomePage(),
    );
  }
}

class XylophoneHomePage extends StatefulWidget {
  @override
  _XylophoneHomePageState createState() => _XylophoneHomePageState();
}

class _XylophoneHomePageState extends State<XylophoneHomePage> {
  late AudioPlayer player;
  int? currentSoundNumber;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  void playSound(int soundNumber) async {
    if (player.state == PlayerState.playing) {
      await player.stop();
    }
    // String audioAsset = 'note$soundNumber;
    await player.play(AssetSource('song$soundNumber.mp3'));
  }


  Widget buildKey({Color? color, required int soundNumber}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            playSound(soundNumber);
          },
          child: const Text('Click to surprise yourself !'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey(color: Colors.red, soundNumber: 1),
            buildKey(color: Colors.orange, soundNumber: 2),
            buildKey(color: Colors.yellow, soundNumber: 3),
            buildKey(color: Colors.green, soundNumber: 4),
            buildKey(color: Colors.teal, soundNumber: 5),
            buildKey(color: Colors.blue, soundNumber: 6),
            buildKey(color: Colors.purple, soundNumber: 7),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
