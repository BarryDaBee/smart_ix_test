import 'package:flutter/material.dart';

class ShrinkableButton extends StatefulWidget {
  const ShrinkableButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;

  @override
  State<ShrinkableButton> createState() => _ShrinkableButtonState();
}

class _ShrinkableButtonState extends State<ShrinkableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 100),
        value: 1,
        lowerBound: 0.9,);
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        _controller.reverse();
      },
      onTapUp: (_) {
        _controller.forward();
      },
      onTapCancel: () {
        _controller.forward();
      },
      onTap: () {
        Future.delayed(const Duration(milliseconds: 200), () {
          widget.onTap();
        });
      },
      child: Transform.scale(
        scale: _curvedAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
