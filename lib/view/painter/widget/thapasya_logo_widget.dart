import 'package:flutter/material.dart';

class ThapasyaLogoWidget extends StatelessWidget {
  final double size;
  const ThapasyaLogoWidget({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _LogoPainter()),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r  = size.width * 0.42;

    // Multicolor ring – right half
    const ringColors = [
      Colors.green, Color(0xFF8BC34A), Colors.yellow,
      Colors.orange, Colors.deepOrange, Colors.pink, Colors.blue,
    ];
    final sweep = 3.14159 / ringColors.length;
    for (int i = 0; i < ringColors.length; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r),
        -1.5708 + i * sweep,
        sweep * 0.92,
        false,
        Paint()
          ..color = ringColors[i]
          ..style = PaintingStyle.stroke
          ..strokeWidth = 15,
      );
    }

    // Vinyl – left half
    canvas.drawPath(
      Path()
        ..moveTo(cx, cy - r)
        ..arcTo(Rect.fromCircle(center: Offset(cx, cy), radius: r),
            -1.5708, 3.14159, false)
        ..close(),
      Paint()..color = const Color(0xFF1A1A1A),
    );
    for (int i = 1; i <= 4; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r * 0.22 * i),
        1.5708, 3.14159, false,
        Paint()
          ..color = Colors.white.withOpacity(0.12)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
    }

    // Golden vertical bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 5, cy - r + 8, 10, r * 1.85),
        const Radius.circular(5),
      ),
      Paint()..color = const Color(0xFFFFB300),
    );

    // Guitar body
    canvas.drawPath(
      Path()..addOval(Rect.fromCenter(
          center: Offset(cx - 8, cy + 16), width: 42, height: 52)),
      Paint()..color = const Color(0xFFE65100),
    );
    canvas.drawCircle(Offset(cx - 8, cy + 16), 10,
        Paint()
          ..color = const Color(0xFFBF360C)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);

    // Drum
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx - 22, cy + r * 0.62), width: 46, height: 28),
      Paint()..color = const Color(0xFF8D4E27),
    );
    for (int i = 0; i < 4; i++) {
      canvas.drawLine(
        Offset(cx - 35 + i * 10.0, cy + r * 0.48),
        Offset(cx - 35 + i * 10.0, cy + r * 0.76),
        Paint()..color = const Color(0xFF5D2E0C)..strokeWidth = 2,
      );
    }

    // Paintbrushes
    for (int i = 0; i < 2; i++) {
      canvas.drawLine(
        Offset(cx - 28 + i * 12.0, cy - r * 0.55),
        Offset(cx - 8  + i * 12.0, cy - r * 0.05),
        Paint()
          ..color = i == 0 ? Colors.blue : const Color(0xFF7B1FA2)
          ..strokeWidth = 3.5
          ..strokeCap = StrokeCap.round,
      );
      canvas.drawCircle(
        Offset(cx - 28 + i * 12.0, cy - r * 0.55), 4,
        Paint()..color = i == 0 ? Colors.lightBlue : Colors.purpleAccent,
      );
    }

    // Flame
    final flamePath = Path()
      ..moveTo(cx, cy - r + 6)
      ..quadraticBezierTo(cx + 9, cy - r - 8,  cx, cy - r - 22)
      ..quadraticBezierTo(cx - 9, cy - r - 8,  cx, cy - r + 6);
    canvas.drawPath(flamePath, Paint()..color = const Color(0xFFFF6D00));
    canvas.drawPath(
      flamePath,
      Paint()
        ..color = const Color(0xFFFFEB3B).withOpacity(0.7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}