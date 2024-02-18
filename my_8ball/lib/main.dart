import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  return runApp(
    const MaterialApp(
      home: ballpage(),
    )
  );
}

class ballpage extends StatelessWidget {
  const ballpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Ask me anything",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const Ball(),
    );
  }
}


class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  var ballNumber= 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(child: TextButton(
                onPressed: (){
                  setState(() {
                    ballNumber= Random().nextInt(5)+1;
                  });
                },
                child: Image.asset('images/ball$ballNumber.png',))),
          ),
        ),
      ],
    );
  }
}
