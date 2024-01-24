import 'package:flutter/material.dart';

/// 가위, 바위, 보 이미지가 들어있는 Card
class InputCard extends StatelessWidget {
  final Widget child;

  const InputCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey, width: 8),
      ),
      child: child,
    );
  }
}