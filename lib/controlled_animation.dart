import 'dart:ffi';

import 'package:flutter/material.dart';

class ControlledAnimation extends StatefulWidget {
  const ControlledAnimation({super.key});

  @override
  State<ControlledAnimation> createState() => _ControlledAnimationState();
}

class _ControlledAnimationState extends State<ControlledAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationWidth;
  late Animation animationBorder;
  late Animation animationAlign;

  late Alignment alignment; // Alignment.bottomRight || Alignment.topCenter
  bool isPressed = false;
  double border = 35;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..forward();

    // alignment = Alignment.bottomRight;

    animationWidth = StepTween(begin: 70, end: 150).animate(controller);

    animationBorder = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(35),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    // var animation = IntTween(begin: 70, end: 150).animate(controller);
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation 1')),
      body: AnimatedBuilder(
        animation: controller,

        builder: (BuildContext context, Widget? child) {
          return Align(
            alignment: alignment,
            child: Container(
              margin: EdgeInsets.all(16),
              height: 70,
              width: animationWidth,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(isPressed ? 35 : 0),
              ),
              child: GestureDetector(
                onTap: () {
                  isPressed ? controller.forward() : controller.reverse();
                  alignment =
                      isPressed ? Alignment.topCenter : Alignment.bottomRight;
                  isPressed = !isPressed;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
