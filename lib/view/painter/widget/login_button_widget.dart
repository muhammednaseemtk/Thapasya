import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const LoginButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.amber,
          disabledBackgroundColor: AppColors.amber.withOpacity(0.6),
          elevation: 4,
          shadowColor: AppColors.amber.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 28,
                    height: 2.5,
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}