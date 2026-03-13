import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/view/auth/login_screen.dart';
import 'package:Thapasya/view/painter/dark_red_bg_painter.dart';
import 'package:Thapasya/view/painter/widget/thapasya_logo_widget.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const _SplashBody();
}

class _SplashBody extends StatefulWidget {
  const _SplashBody();

  @override
  State<_SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<_SplashBody>
    with TickerProviderStateMixin {
  late final AnimationController _bgCtrl;
  late final AnimationController _logoCtrl;
  late final AnimationController _textCtrl;

  late final Animation<double> _bgFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _bgCtrl   = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _logoCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _textCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _bgFade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _bgCtrl, curve: Curves.easeIn));

    _logoScale = Tween<double>(begin: 0.3, end: 1)
        .animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut));

    _logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _textFade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeIn));

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeOut));

    _runSequence();
  }

  Future<void> _runSequence() async {
    await _bgCtrl.forward();
    await _logoCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _textCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _logoCtrl.dispose();
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: FadeTransition(
        opacity: _bgFade,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const CustomPaint(painter: DarkRedBgPainter()),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _logoScale,
                    child: FadeTransition(
                      opacity: _logoFade,
                      child: const ThapasyaLogoWidget(size: 200),
                    ),
                  ),
                  const SizedBox(height: 36),
                  SlideTransition(
                    position: _textSlide,
                    child: FadeTransition(
                      opacity: _textFade,
                      child: Column(
                        children: [
                          const Text(
                            'THAPASYA',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 7,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Arts & Culture Academy',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(0.65),
                              fontSize: 14,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}