// tirado do animacao1

import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  bool pressed = true;
  Duration duration = Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício Animação 01')),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: pressed ? Alignment.bottomRight : Alignment.topCenter,
            duration: duration,
            child: AnimatedContainer(
              curve: Curves.linear,
              margin: EdgeInsets.all(16),
              width: pressed ? 70 : 150,
              height: 70,
              duration: duration,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(pressed ? 35 : 0),
                color: Colors.blue,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pressed = !pressed;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
