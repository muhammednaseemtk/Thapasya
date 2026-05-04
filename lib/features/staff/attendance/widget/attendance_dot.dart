import 'package:flutter/material.dart';

class AttendanceDot extends StatelessWidget {
  final bool isActive;
  final Color color;
  final VoidCallback onTap;

  const AttendanceDot({
    super.key,
    required this.isActive,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: isActive ? color : color.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}