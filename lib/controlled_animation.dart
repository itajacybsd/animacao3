import 'package:flutter/material.dart';

class ControlledAnimation extends StatefulWidget {
  const ControlledAnimation({super.key});

  @override
  State<ControlledAnimation> createState() => _ControlledAnimationState();
}

class _ControlledAnimationState extends State<ControlledAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationWidth;
  late Animation<double> _animationBorder;
  late Animation<Alignment> _animationAlign;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animationController.addListener(listener);

    _animationWidth = Tween<double>(
      begin: 70,
      end: 150,
    ).animate(_animationController);

    _animationBorder = Tween<double>(
      begin: 35,
      end: 0,
    ).animate(_animationController);

    _animationAlign = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(_animationController);
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.removeListener(listener);
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício de Animação Controlada 1')),
      body: Align(
        alignment: _animationAlign.value,
        child: GestureDetector(
          onTap: () {
            _animationController.isCompleted
                ? _animationController.reverse()
                : _animationController.forward();
          },
          child: Container(
            margin: EdgeInsets.all(16),
            height: 70,
            width: _animationWidth.value,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(_animationBorder.value),
            ),
          ),
        ),
      ),
    );
  }
}
