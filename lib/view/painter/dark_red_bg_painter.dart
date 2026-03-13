import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DarkRedBgPainter extends CustomPainter {
  const DarkRedBgPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.bgGradient,
        ).createShader(rect),
    );

    const stripes = [
      _S(0.02, 0.32), _S(0.20, 0.18), _S(0.38, 0.28),
      _S(0.55, 0.16), _S(0.72, 0.26), _S(0.88, 0.14),
    ];

    for (final s in stripes) {
      final x = size.width * s.offset;
      const w = 130.0;
      final path = Path()
        ..moveTo(x - size.height * 0.55, 0)
        ..lineTo(x - size.height * 0.55 + w, 0)
        ..lineTo(x + w, size.height)
        ..lineTo(x, size.height)
        ..close();

      canvas.drawPath(
        path,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.stripeLight.withOpacity(s.alpha),
              AppColors.stripeDark.withOpacity(s.alpha * 0.4),
            ],
          ).createShader(rect),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _S {
  final double offset, alpha;
  const _S(this.offset, this.alpha);
}