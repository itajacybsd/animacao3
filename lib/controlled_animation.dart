import 'package:flutter/material.dart';

class ControlledAnimation extends StatelessWidget {
  const ControlledAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation 1')),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.all(16),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}
