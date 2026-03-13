import 'package:Thapasya/controller/auth_controller.dart';
import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_constants.dart';
import 'package:Thapasya/view/painter/widget/custom_input_field.dart';
import 'package:Thapasya/view/painter/widget/login_button_widget.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => const _LoginBody();
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _obscurePassword = true;

  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();

  late final AnimationController _slideCtrl;
  late final Animation<Offset>   _slideAnim;
  late final Animation<double>   _fadeAnim;

  @override
  void initState() {
    super.initState();
    _slideCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideCtrl, curve: Curves.easeOutCubic));

    _fadeAnim = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _slideCtrl, curve: Curves.easeIn));

    _slideCtrl.forward();
  }

  @override
  void dispose() {
    _slideCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    AuthController.email    = _emailCtrl.text.trim();
    AuthController.password = _passwordCtrl.text;

    setState(() => _isLoading = true);
    final success = await AuthController.login();
    if (!mounted) return;
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'Login successful!' : 'Invalid email or password.',
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor:
            success ? AppColors.greenBottom : Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // ── Top white area (logo zone) ──────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.45,
            child: const ColoredBox(color: AppColors.white),
          ),

          // ── Bottom green gradient fills remainder ───────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.58,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.greenTop, AppColors.greenBottom],
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
              ),
            ),
          ),

          // ── Slide-up card ───────────────────────────────────────
          SafeArea(
            child: SlideTransition(
              position: _slideAnim,
              child: FadeTransition(
                opacity: _fadeAnim,
                child: Column(
                  children: [
                    // Logo space (top white area)
                    SizedBox(height: screenHeight * 0.30),

                    // Green card fills rest
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.greenTop, AppColors.greenBottom],
                          ),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(36),
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              const Center(
                                child: Text(
                                  AppConstants.login,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),

                              // Email field
                              CustomInputField(
                                label: AppConstants.emailId,
                                hint: AppConstants.emailHint,
                                controller: _emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: AppColors.greyText,
                                  size: 20,
                                ),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.all(12),
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Password field
                              CustomInputField(
                                label: AppConstants.password,
                                hint: AppConstants.passwordHint,
                                obscureText: _obscurePassword,
                                controller: _passwordCtrl,
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.greyText,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Forgot password
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    AppConstants.forgotPass,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),

                              // Login button
                              LoginButtonWidget(
                                label: AppConstants.login,
                                onPressed: _handleLogin,
                                isLoading: _isLoading,
                              ),
                              const SizedBox(height: 24),

                              // Register link
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: AppConstants.noAccount,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            AppConstants.registerNow,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
