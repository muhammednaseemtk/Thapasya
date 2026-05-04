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
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
        child: Center(
          child: isActive
              ? Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
