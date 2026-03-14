import 'package:flutter/material.dart';

class AnimatedDiagonalBackground extends StatefulWidget {
  final Widget child;
  const AnimatedDiagonalBackground({super.key, required this.child});

  @override
  State<AnimatedDiagonalBackground> createState() => _AnimatedDiagonalBackgroundState();
}

class _AnimatedDiagonalBackgroundState extends State<AnimatedDiagonalBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _shimmer = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) => CustomPaint(
        painter: _DiagonalPainter(_shimmer.value),
        child: widget.child,
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  final double shimmer;
  const _DiagonalPainter(this.shimmer);

  static const stripes = [
    (-0.6, 0.18, 0xCC000000),
    (-0.1, 0.15, 0xAA000000),
    (0.35, 0.12, 0xBB000000),
    (0.75, 0.10, 0x99000000),
  ];

  static const vignetteGradient = RadialGradient(
    radius: 1.2,
    colors: [Colors.transparent, Colors.black54],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Animated base gradient shift
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.lerp(const Color(0xFF8B0000), const Color(0xFF6B0000), shimmer)!,
            Color.lerp(const Color(0xFF3A0000), const Color(0xFF1A0000), shimmer)!,
            const Color(0xFF000000),
            Color.lerp(const Color(0xFF4A0000), const Color(0xFF7A0000), shimmer)!,
            Color.lerp(const Color(0xFF8B0000), const Color(0xFF6B0000), shimmer)!,
          ],
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ).createShader(rect),
    );

    for (final (offset, width, color) in stripes) {
      _drawStripe(canvas, size, offset, width, Color(color));
    }

    // Animated shimmer sweep
    _drawShimmer(canvas, size);

    canvas.drawRect(
      rect,
      Paint()..shader = vignetteGradient.createShader(rect),
    );
  }

  void _drawShimmer(Canvas canvas, Size size) {
    final cx = size.width * (-0.5 + shimmer * 2.0);
    final sw = size.width * 0.25;

    canvas.drawPath(
      Path()
        ..moveTo(cx - sw / 2, 0)
        ..lineTo(cx + sw / 2, 0)
        ..lineTo(cx + sw / 2 - size.height, size.height)
        ..lineTo(cx - sw / 2 - size.height, size.height)
        ..close(),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.0),
            Colors.white.withValues(alpha: 0.04),
            Colors.white.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(cx - sw, 0, sw * 2, size.height)),
    );
  }

  void _drawStripe(Canvas canvas, Size size, double offset, double width, Color color) {
    final cx = size.width * (0.5 + offset);
    final sw = (size.width + size.height) * width;

    canvas.drawPath(
      Path()
        ..moveTo(cx - sw / 2, 0)
        ..lineTo(cx + sw / 2, 0)
        ..lineTo(cx + sw / 2 - size.height, size.height)
        ..lineTo(cx - sw / 2 - size.height, size.height)
        ..close(),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color, Color.fromARGB((color.alpha * 0.3).toInt(), color.r.toInt(), color.g.toInt(), color.b.toInt()), color],
        ).createShader(Rect.fromLTWH(cx - sw, 0, sw * 2, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant _DiagonalPainter old) => old.shimmer != shimmer;
}